Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
 by mx.groups.io with SMTP id smtpd.web09.16845.1581305751332596068
 for <docs@lists.yoctoproject.org>;
 Sun, 09 Feb 2020 19:35:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=pYLhCfD5;
 spf=neutral (domain: iki.fi, ip: 66.111.4.29, mailfrom: tanuk@iki.fi)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 7D4C52125E
	for <docs@lists.yoctoproject.org>; Sun,  9 Feb 2020 22:35:50 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Sun, 09 Feb 2020 22:35:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=6GA6emLA+x79NY0eB
	gPCECt0I311dGNc5fbrChykL4c=; b=pYLhCfD5XqX2kkYKKb2rcLEnbxBc0+v9n
	oFV03x6VqckAWQVfv5jQHnOyItpohaCL7zfCGkAgXHNFiQGI9XWsc/d3H5mECj+a
	dxrzZ5y/XsK7liCiYchuj5WjKQQr1nBAbUllbImZqejxe1Gku2qXPmaOhCasOsVu
	MK+5gWWaxWZPpQ8TV7VTYP9RjcVFbtpWj1vyH59jTHiN/I9pAMN7Z2eiwDZ5q9fW
	QNA2S5NtgQ++XAKUXd/uKwGOnS50e9FyAaYpx6/waFY5HRUNs1jFUdIRSIOMhG5g
	UnsvQzOulxrd3EMEa9brdIxZT2Kf4KVM3TARZ/57/bPRIsxhwbDgQ==
X-ME-Sender: <xms:lc9AXlgNJ7GMjRFtyRq8JN4Ps3x4RLIoOWN5fj8HzA_Hj2cj1D2W2w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedriedtgddvkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
    dtnecuhfhrohhmpefvrghnuhcumfgrshhkihhnvghnuceothgrnhhukhesihhkihdrfhhi
    qeenucffohhmrghinheprghlshgrqdhprhhojhgvtghtrdhorhhgnecukfhppeduleeird
    dvgeegrdduledurddutdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
    rghilhhfrhhomhepthgrnhhukhesihhkihdrfhhi
X-ME-Proxy: <xmx:lc9AXnJ701WpjWurN1VEQxyiI4xJuayGoPnm6xLytynpX3MmXuGqzQ>
    <xmx:lc9AXkFVCDlC_He-Ra62N2xnLYmdrmbHI7EW8kk8gGUwHxYH10xZFg>
    <xmx:lc9AXrT6SREsdXCypScGUcNXDM7M6P1aKTwJfYBCXpJ-bghT2v4MFA>
    <xmx:ls9AXh8HUlVWdXxx0rUG9jeFAXDWyqr_FCFGSy7cKK1ACy4-tzog9w>
Received: from localhost.localdomain (unknown [196.244.191.106])
	by mail.messagingengine.com (Postfix) with ESMTPA id 734A63060272
	for <docs@lists.yoctoproject.org>; Sun,  9 Feb 2020 22:35:49 -0500 (EST)
From: "Tanu Kaskinen" <tanuk@iki.fi>
To: docs@lists.yoctoproject.org
Subject: [PATCH][RESEND] dev-manual: Explain unpacking archives without a top-level directory
Date: Mon, 10 Feb 2020 05:29:52 +0200
Message-Id: <20200210032951.24156-1-tanuk@iki.fi>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
---

I originally sent this to yocto@lists.yoctoproject.org on 2020-01-14.

 documentation/dev-manual/dev-manual-common-tasks.xml | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/documentation/dev-manual/dev-manual-common-tasks.xml b/documentation/dev-manual/dev-manual-common-tasks.xml
index 1e6addde4..525ec1830 100644
--- a/documentation/dev-manual/dev-manual-common-tasks.xml
+++ b/documentation/dev-manual/dev-manual-common-tasks.xml
@@ -2085,7 +2085,15 @@
                 However, if <filename>SRC_URI</filename> specifies to fetch
                 source from an archive that does not use this convention,
                 or from an SCM like Git or Subversion, your recipe needs to
-                define <filename>S</filename>.
+                define <filename>S</filename>, except if the archive doesn't
+                use any top-level subdirectory. In that case you need to tell
+                Bitbake to do the unpacking in a subdirectory, this example is
+                from the
+                <filename>meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.1.2.bb</filename>
+                recipe:
+                <literallayout class='monospaced'>
+     SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2;subdir=${BP}"
+                </literallayout>
             </para>
 
             <para>
-- 
2.20.1

