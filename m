Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web08.26294.1630955534253305655
 for <docs@lists.yoctoproject.org>;
 Mon, 06 Sep 2021 12:12:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpe08a7c099a2b1-cm08a7c099a2af.cpe.net.cable.rogers.com ([174.114.56.109]:58792 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mNK2O-0005Rh-Ol
	for docs@lists.yoctoproject.org; Mon, 06 Sep 2021 15:12:13 -0400
Date: Mon, 6 Sep 2021 15:12:09 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] ref-manual: remove mention of obsolete devtool "--any-recipe" option
Message-ID: <dfb2db5e-e71f-a830-8a6d-0f390b7a3bc@crashcourse.ca>
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=US-ASCII


Running "devtool edit-recipe -h" produces, in part, the output:

  --any-recipe, -a  Does nothing (exists for backwards-compatibility)

so it seems of little value to continue referring to it.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/ref-manual/devtool-reference.rst b/documentation/ref-manual/devtool-reference.rst
index 1862c481d..6bbbd1a91 100644
--- a/documentation/ref-manual/devtool-reference.rst
+++ b/documentation/ref-manual/devtool-reference.rst
@@ -284,10 +284,7 @@ is identified using the ``EDITOR`` variable, on the specified recipe.
 When you use the ``devtool edit-recipe`` command, you must supply the
 root name of the recipe (i.e. no version, paths, or extensions). Also,
 the recipe file itself must reside in the workspace as a result of the
-``devtool add`` or ``devtool upgrade`` commands. However, you can
-override that requirement by using the "-a" or "--any-recipe" option.
-Using either of these options allows you to edit any recipe regardless
-of its location.
+``devtool add`` or ``devtool upgrade`` commands.

 .. _devtool-updating-a-recipe:


-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
