Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web10.2894.1601713425357770482
 for <docs@lists.yoctoproject.org>;
 Sat, 03 Oct 2020 01:23:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.178.231, mailfrom: foss@0leil.net)
Received: from fiqs.lan (80-110-110-137.cgn.dynamic.surfer.at [80.110.110.137])
	(Authenticated sender: foss@0leil.net)
	by relay11.mail.gandi.net (Postfix) with ESMTPA id 1D57E100006;
	Sat,  3 Oct 2020 08:23:42 +0000 (UTC)
From: "Quentin Schulz" <foss@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <foss@0leil.net>
Subject: [PATCH 1/3] docs: ref-manual: ref-variables: fix one-letter pointer links in glossary
Date: Sat,  3 Oct 2020 10:23:34 +0200
Message-Id: <20201003082336.55703-1-foss@0leil.net>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since the move to sphinx, variables aren't linked with var- anchors but
term-.

Let's fix that so clicking on a letter will bring to the correct variable
in the page.

Signed-off-by: Quentin Schulz <foss@0leil.net>
---
 documentation/ref-manual/ref-variables.rst | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/documentation/ref-manual/ref-variables.rst b/documentation/ref-manual/ref-variables.rst
index 2d6719df1..e238b1247 100644
--- a/documentation/ref-manual/ref-variables.rst
+++ b/documentation/ref-manual/ref-variables.rst
@@ -7,14 +7,14 @@ Variables Glossary
 This chapter lists common variables used in the OpenEmbedded build
 system and gives an overview of their function and contents.
 
-`A <#var-ABIEXTENSION>`__ :term:`B` `C <#var-CACHE>`__
-:term:`D` `E <#var-EFI_PROVIDER>`__ `F <#var-FEATURE_PACKAGES>`__
-`G <#var-GCCPIE>`__ `H <#var-HOMEPAGE>`__ `I <#var-ICECC_DISABLED>`__
-`K <#var-KARCH>`__ `L <#var-LABELS>`__ `M <#var-MACHINE>`__
-`N <#var-NATIVELSBSTRING>`__ `O <#var-OBJCOPY>`__ :term:`P`
-`R <#var-RANLIB>`__ :term:`S` :term:`T`
-`U <#var-UBOOT_CONFIG>`__ `V <#var-VOLATILE_LOG_DIR>`__
-`W <#var-WARN_QA>`__ `X <#var-XSERVER>`__
+:term:`A <ABIEXTENSION>` :term:`B` :term:`C <CACHE>`
+:term:`D` :term:`E <EFI_PROVIDER>` :term:`F <FEATURE_PACKAGES>`
+:term:`G <GCCPIE>` :term:`H <HOMEPAGE>` :term:`I <ICECC_DISABLED>`
+:term:`K <KARCH>` :term:`L <LABELS>` :term:`M <MACHINE>`
+:term:`N <NATIVELSBSTRING>` :term:`O <OBJCOPY>` :term:`P`
+:term:`R <RANLIB>` :term:`S` :term:`T`
+:term:`U <UBOOT_CONFIG>` :term:`V <VOLATILE_LOG_DIR>`
+:term:`W <WARN_QA>` :term:`X <XSERVER>`
 
 .. glossary::
 
-- 
2.26.2

