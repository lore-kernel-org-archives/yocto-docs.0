Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08BC8D29FB3
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 07:48:55 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.40792.1730879325301261878
 for <docs@lists.yoctoproject.org>;
 Tue, 05 Nov 2024 23:48:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=c79zFO8M;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 40728FF804;
	Wed,  6 Nov 2024 07:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730879323;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PjfSru98hM0ZFgJsBO+ftTbeWQTe59svxKnx7BPhGkc=;
	b=c79zFO8M+AQ2aTbB8kelNaM0h+Czau0C0qdeBl8soBF7V3zG716zFNBQ665IFjosew3EAv
	phDx63SfqLXgG3lnqxJQdXrzIzfPw0wiM78agqzSk/6S5iMgII6zNc2WdLJijig103M7D4
	AvM1d2fYr9VqI50FYqfFvLbgzka8/9FSKAD9+paKYmXKvn9F2fhbz4w4jTezu/0oxW/dKY
	j1nITeGLBHowfwzYz5unnjRdJDFVASeRdgdab9m54jtlEQkoCeou2qBlrh9w8S5tpWLkWR
	XuhEsXcl7j3OWfOlyHuC48UYWf4Qo713G/0VjCKvUhC230t22Dg0b8dMPGxF7g==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 0/5] Add support for PDF/Epub generation
Date: Wed, 06 Nov 2024 08:48:22 +0100
Message-Id: <20241106-pdf-xetex-v1-0-044eab7e77d3@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEYfK2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDA0MD3YKUNN2K1JLUCl0Ds8RksySDNLMkC3MloPqCotS0zAqwWdGxtbU
 A5bOvzlsAAAA=
X-Change-ID: 20241010-pdf-xetex-06ac6b0f6b87
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Richard Purdie <richard.purdie@linuxfoundation.org>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Michael Opdenacker <michael.opdenacker@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2210;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=7ZrcMvcSe0sP+CA7vbFaufDR1FjvKBd7A1NDj2Nf4+E=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnKx9aRjx+mmsqkOD6Ch97tjYCVZQeRXQxvgatm
 RFCFd8L6Y6JAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZysfWgAKCRDRgEFAKaOo
 NoqQD/9TesFeIwYjHj5m3GRIrmIef8ZPUDqjq2I8pd8u/ZatiLdvXKD4I9EuhqXWcD5493Oj4le
 jFfmApGbHvx3kDX5HsGt6KjX5G7FtG/fVF9xvp2ZRltW3+/IefwPzKZWYZqkZsnxyLaNtCectdt
 xznhcTGk44SOTZgRnEkXlYWCJdkEQA/pXQcvOT9AjtpWQmGqUKXhxCcylINo0A6N373R3zS51li
 A5O8U18nKNTFnYw/JaifkrbZPD59LmWR/9ESadcTu3W3lWdVf3av3QrLQCwxWfGcdHTbV9Z4Jgy
 Fk671tNoJAK1nj/ipLW1y6rz9XLckpWzxIeVAAObuDYFDFEc6vrpJCiVCHEDFJOnLMth1aYHCcO
 AITxw+dKbF8cN2tsTMXSkbguahgo33p5w1eZ7ot/WHCdHvmW8mJavrL9P3Bc4BrVlUpDDsE+Z6P
 vPKziD0DqjyqMkCiYNeLuo6nI7sHiP7CwN7uozb87VpSk+VTXirXOzbjI5LnT6CbPtWn6iN1ksS
 LcM4QBwQFD0dQvCHCrf658kbPjN4PiYx9UBJMY8HcHHd/BFFeVpN2zPj0vVRVN8KScH45sYlcWu
 XUthKMSXBCDmYW+PMkbCGTaWa+NM4XiASiGlZV1z3V1yTqYdCVhWXZv9GmnUPunFYC7sB/+hQx0
 dKnzcRzsX4pyaMQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 06 Nov 2024 07:48:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5685

This patch series includes commits that enable PDF and Epub generation
during `make publish` and that includes them in the sidebar as a new
"Documentation Downloads" section. The files can be downloaded directly
from there and are displayed as a list in this page.

Example outputs:

- PDF: https://lufi.bootlin.com/r/PBq0qGTwBy#6JIczWeLiAjcwn9udqAeTaoHuZhoXq6sL/vpktteg5w=
- EPub: https://lufi.bootlin.com/r/_wRND0dvKD#88YA3opgX/CJTaGT3m5GxKBMBYeNfcR2VN3x7wnCU/E=

This patch series also changes the following:

- Don't use inkscape but rsvg-convert, a lighter tool for SVG conversion
  that can be included in a buildtools tarball.
- Build the PDF with xelatex instead of pdflatex, to support foreign
  characters (the pdf build is currently failing because of that).

On the autobuilder, the necessary was made to make texlive/xelatex and
so on available to the docs build (see run-docs-build).

The series also brings a change to switchers.js.in, to make the file
compatible with newer versions of Sphinx. Note: on the autobuilder, we
aim to build using the newer Sphinx (8.1.3).

I'm currently working on updating the dependency list in poky.yaml.in
(and where this file is used), but would like to send this series first
to have some feedback.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (4):
      doc: Makefile: remove inkscape, replace by rsvg-convert
      doc: Makefile: add support for xelatex
      doc: add a download page for epub and pdf
      sphinx-static/switchers.js.in: do not refer to URL_ROOT anymore

Michael Opdenacker (1):
      doc: Makefile: publish pdf and epub versions too

 documentation/Makefile                      | 17 +++++++++++------
 documentation/conf.py                       |  7 ++++++-
 documentation/downloads.rst                 | 11 +++++++++++
 documentation/index.rst                     |  7 +++++++
 documentation/sphinx-static/switchers.js.in |  6 ++++++
 5 files changed, 41 insertions(+), 7 deletions(-)
---
base-commit: bb472a7000672ce836573c3f2d3baf42cca01546
change-id: 20241010-pdf-xetex-06ac6b0f6b87

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


