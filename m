Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37906.1793174719087377997
 for <docs@lists.yoctoproject.org>;
 Wed, 28 Oct 2026 01:05:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=oWoiCmC2;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6E2FC1A1376
	for <docs@lists.yoctoproject.org>; Wed, 28 Oct 2026 08:05:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3BEEB60769
	for <docs@lists.yoctoproject.org>; Wed, 28 Oct 2026 08:05:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 68A541032906B;
	Wed, 28 Oct 2026 09:05:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793174716; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZrAW1IJ0eBIvr6imzk3aCIf8PXHbPxRM5pT9LRcqIlc=;
	b=oWoiCmC2cFq/gZHJRs0gDh0NAXKxsrSU/qu/3gUz/xZcWEXGpVZevlB+FdPcbTFWPlKXAd
	8NC7tLY9M4pO4schgMqbdKN8yMirmhZDqqMX+Z3h5v2R3EGaQrocKaEkHh59KTYKmL/QNE
	jgSF8n234PfuV70GrKRAZ0PTch4u/amkdyK5sw+9YEBcVS3Jt96hvan4KMvHi/PvU/8Xvn
	7yQ20AZYOl5WBIQEbMN/B6SaLDE4U7ZUFv2JNa7gCvR7Hgm8L9XMr3lP4Ljuo43rLSm1jd
	IfqmenOaUH1EGBlb3QFDSu6w1AN1ok8YCF+7tmI8b9RIEIFj7cC7jExO/WfP0w==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 28 Oct 2026 09:04:54 +0100
Subject: [PATCH 2/8] tools/host_packages_scripts/pip3_docs.sh: update for
 sphinx-tags
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-tags-v1-2-d5ad01019eae@bootlin.com>
References: <20261028-tags-v1-0-d5ad01019eae@bootlin.com>
In-Reply-To: <20261028-tags-v1-0-d5ad01019eae@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Antonin Godard <antonin.godard@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=993;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=Yw8pV7qIARAjZuxVw2qbNvbDQOGuM42IiRkPoJkh1ZQ=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBq4ay32xg4+YjrNEXyE4bD8L5GmjNW+J6JwbDG6
 Jx4Vs8/wimJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCauGstwAKCRDRgEFAKaOo
 NsOyD/sHFItVZU8x3Ia9UDIxAJ+s6Oa9LI5X+Sh3U1ZlHNSD5KuuRs2IIzZ7puJY4FvvS8HzrSU
 L1wkf9WGrzg1MvcIKE5mvpriugBCbfPhxtQFxFoJkVbEHYftAA1HSMEB5oYWBagRh1duazFpQ5V
 /ISufEdl5wLoy9609KnFsu5I6RmurRet+Ju20pt6xIsn+nLGmVszIiwgoRSTyQBcniTe9LRfHKM
 eJBPaoeHhc6W227PKkuyhmvQKnCT/Iw6SltsH4cfKlnheJk71PCBeunFg8TjGCn8+XQBwvG7b2x
 x9C+hPZ4F/PQ0x7r4+PsTIpCX4uzItcgE9u0bqWiC7YVlx5u1htlmpSQV7flxQTC548F3KVEuo0
 Z363Z9Y+QlDDqkmKD/ukt1rOCIe+jXXfXy6RUEwTKzSI0qH2LsSq1029iG5pH/GpXDTouBMikfp
 Gd3gul0PIqddk1IvmIYqCKmyjITSi2x4eQXJ6HU81sxT8eOlLabzSZTWVRVYHGLeGswzTbh9Bm4
 8G9YS1VwFeRt78tRmPTvrkdr1DRLRsA14O6TVVC/aYZ6cW3aFicUc6/jUJrp0RZqD2uZbW22aNZ
 fI3UjG5tKwcqDjpV6PNK3Au2Okw6pG6QQFGNCt6zqvgXT9aPw0ne46H4g8mzFDcXxlD78I2KwOS
 KynnV8XrHum9/+w==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Wed, 28 Oct 2026 08:05:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10729

To prepare for the sphinx-tags addition, update the container build
scripts and add sphinx-tag, as well as sphinx-design which is a
dependency of sphinx-tags.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/tools/host_packages_scripts/pip3_docs.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/tools/host_packages_scripts/pip3_docs.sh b/documentation/tools/host_packages_scripts/pip3_docs.sh
index 852845783..2a67f0d18 100644
--- a/documentation/tools/host_packages_scripts/pip3_docs.sh
+++ b/documentation/tools/host_packages_scripts/pip3_docs.sh
@@ -1,3 +1,3 @@
 python3 -m venv --clear ./yocto-docs-venv
 . ./yocto-docs-venv/bin/activate
-python3 -m pip install sphinx sphinx_rtd_theme pyyaml sphinx-copybutton 'sphinxcontrib-svg2pdfconverter>=2.0.0'
+python3 -m pip install sphinx sphinx_rtd_theme pyyaml sphinx-copybutton sphinx-design sphinx-tags 'sphinxcontrib-svg2pdfconverter>=2.0.0'

-- 
2.55.0

