---
name: 'Scam Shield: Multi-Model Voting and Fine-Tuned LLMs Against Adversarial Attacks'
speakers:
  - Chen-Wei Chang et al.
categories:
  - Full Papers
  - Full Paper
---

Scam detection remains a critical challenge in cybersecurity as adversaries craft messages that evade automated filters. We propose a Hierarchical Scam Detection System(HSDS) that combines a lightweight multi-model voting front end with a fine-tuned LLaMA~3.1~8B Instruct back end to improve accuracy and robustness against adversarial attacks. An ensemble of four classifiers provides preliminary predictions through majority vote, and ambiguous cases are escalated to the fine-tuned model, which is optimized with adversarial training to reduce misclassification. Experiments show that this hierarchical design both improves adversarial scam detection and shortens inference time by routing most cases away from the LLM, outperforming traditional machine-learning baselines and proprietary LLM baselines. The findings highlight the effectiveness of a hybrid voting mechanism and adversarial fine-tuning in fortifying LLMs against evolving scam tactics, enhancing the resilience of automated scam detection systems.
