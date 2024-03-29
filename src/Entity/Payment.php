<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints as Assert;

/**
 * Payment
 *
 * @ORM\Table(name="payment", indexes={@ORM\Index(name="fk_payment_participant1_idx", columns={"participant_id"})})
 * @ORM\Entity
 */
class Payment
{
    /**
     * @Assert\Type(type="App\Entity\Participant")
     * @Assert\Valid
     */

    /**
     * @var int
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $id;

    /**
     * @var int|null
     *
     * @ORM\Column(name="amount", type="integer", nullable=true)
     * @Assert\Range(
     *  min = 0)
     */
    private $amount;

    /**
     * @var \DateTime|null
     *
     * @ORM\Column(name="created_at", type="datetime", nullable=true)
     */
    private $createdAt;

    /**
     * @var \DateTime|null
     *
     * @ORM\Column(name="updated_at", type="datetime", nullable=true)
     */
    private $updatedAt;

    /**
     * @var \Participant
     *
     * @ORM\ManyToOne(targetEntity="Participant", cascade={"persist"})
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="participant_id", referencedColumnName="id")
     * })
     */
    private $participant;

    /**
     * @var bool          
     *  @ORM\Column(name="hiddenIdentity", type="boolean", nullable=true, options={"default"=0
     *  })            
     */     
    
    private $hiddenIdentity;

    /**       
     * @var bool           
     *  @ORM\Column(name="hiddenAmount", type="boolean", nullable=true, options={"default"=0
     *  })            
     */     
    
    private $hiddenAmount;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getAmount(): ?int
    {
        return $this->amount;
    }

    public function setAmount(?int $amount): self
    {
        $this->amount = $amount;

        return $this;
    }

    public function getCreatedAt(): ?\DateTimeInterface
    {
        return $this->createdAt;
    }

    public function setCreatedAt(?\DateTimeInterface $createdAt): self
    {
        $this->createdAt = $createdAt;

        return $this;
    }

    public function getUpdatedAt(): ?\DateTimeInterface
    {
        return $this->updatedAt;
    }

    public function setUpdatedAt(?\DateTimeInterface $updatedAt): self
    {
        $this->updatedAt = $updatedAt;

        return $this;
    }

    public function getParticipant(): ?Participant
    {
        return $this->participant;
    }

    public function setParticipant(?Participant $participant): self
    {
        $this->participant = $participant;

        return $this;
    }
    public function getHiddenIdentity(): ?bool
    {
        return $this->hiddenIdentity;
    }

    public function setHiddenIdentity(?bool $hiddenIdentity): self
    {
        $this->hiddenIdentity = $hiddenIdentity;

        return $this;
    }

    public function getHiddenAmount(): ?bool
    {
        return $this->hiddenAmount;
    }

    public function setHiddenAmount(?bool $hiddenAmount): self
    {
        $this->hiddenAmount = $hiddenAmount;

        return $this;
    }
}
