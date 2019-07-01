<?php

namespace App\Controller;

use App\Entity\Payment;
use App\Entity\Participant;
use App\Form\PaymentType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\Campaign;

/**
 * @Route("/payment")
 */
class PaymentController extends AbstractController
{
    /**
     * @Route("/", name="payment_index", methods={"GET"})
     */
    public function index(): Response
    {
        $payments = $this->getDoctrine()
            ->getRepository(Payment::class)
            ->findAll();

        return $this->render('payment/index.html.twig', [
            'payments' => $payments,
        ]);
    }

    /**
     * @Route("/new/{id}", name="payment_new", methods={"GET","POST"})
     */
    public function new(Request $request, Campaign $campaign, $id): Response
    {
        $payment = new Payment();
        $form = $this->createForm(PaymentType::class, $payment);
        $form->handleRequest($request);
       // dd(getParticipant());
        if ($form->isSubmitted() && $form->isValid()) {
            $payment->getParticipant()->setCampaign($campaign);
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($payment);
            $entityManager->flush();

            return $this->redirectToRoute('campaign_show', ['id' => $campaign->getId()]);
        }

        return $this->render('payment/new.html.twig', [
            'payment' => $payment,
            'form' => $form->createView(),
            'campaign' => $id,
        ]);
    }

    /**
     * @Route("/{id}", name="payment_show", methods={"GET"})
     */
    public function show(Payment $payment): Response
    {
        return $this->render('payment/show.html.twig', [
            'payment' => $payment,
        ]);
    }

    /**
     * @Route("/{id}/edit", name="payment_edit", methods={"GET","POST"})
     */
    public function edit(Request $request, Payment $payment): Response
    {
        $form = $this->createForm(PaymentType::class, $payment);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('payment_index', [
                'id' => $payment->getId(),
            ]);
        }

        return $this->render('payment/edit.html.twig', [
            'payment' => $payment,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="payment_delete", methods={"DELETE"})
     */
    public function delete(Request $request, Payment $payment): Response
    {
        if ($this->isCsrfTokenValid('delete'.$payment->getId(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($payment);
            $entityManager->flush();
        }

        return $this->redirectToRoute('payment_index');
    }
}
