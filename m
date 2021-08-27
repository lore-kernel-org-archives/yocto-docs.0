Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web11.641.1630094268942825290
 for <docs@lists.yoctoproject.org>;
 Fri, 27 Aug 2021 12:57:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpe08a7c099a2b1-cm08a7c099a2af.cpe.net.cable.rogers.com ([174.114.56.109]:45170 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mJhz0-0005TB-1N
	for docs@lists.yoctoproject.org; Fri, 27 Aug 2021 15:57:47 -0400
Date: Fri, 27 Aug 2021 15:57:43 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] dev manual, ch 1: various pedantic nitpickery
Message-ID: <f110ee5f-4b96-2310-d02e-9f943d6f5b4b@crashcourse.ca>
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


Some minor grammatical and structure tweaks.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  two general changes i'm going to submit for all of dev manual (among
others):

  1) no exclamation marks, unless you're referring to the rock duo
     wham!

  2) no unnecessary capitalization

diff --git a/documentation/dev-manual/intro.rst b/documentation/dev-manual/intro.rst
index 23c848e87..0f7370a96 100644
--- a/documentation/dev-manual/intro.rst
+++ b/documentation/dev-manual/intro.rst
@@ -7,16 +7,16 @@ The Yocto Project Development Tasks Manual
 Welcome
 =======

-Welcome to the Yocto Project Development Tasks Manual! This manual
+Welcome to the Yocto Project Development Tasks Manual. This manual
 provides relevant procedures necessary for developing in the Yocto
 Project environment (i.e. developing embedded Linux images and
-user-space applications that run on targeted devices). The manual groups
+user-space applications that run on targeted devices). This manual groups
 related procedures into higher-level sections. Procedures can consist of
 high-level steps or low-level steps depending on the topic.

 This manual provides the following:

--  Procedures that help you get going with the Yocto Project. For
+-  Procedures that help you get going with the Yocto Project; for
    example, procedures that show you how to set up a build host and work
    with the Yocto Project source repositories.

@@ -24,25 +24,25 @@ This manual provides the following:
    Changes can be improvements, new features, or bug fixes.

 -  Procedures related to "everyday" tasks you perform while developing
-   images and applications using the Yocto Project. For example,
-   procedures to create a layer, customize an image, write a new recipe,
+   images and applications using the Yocto Project, such as
+   creating a new layer, customizing an image, writing a new recipe,
    and so forth.

 This manual does not provide the following:

--  Redundant Step-by-step Instructions: For example, the
+-  Redundant step-by-step instructions: For example, the
    :doc:`/sdk-manual/index` manual contains detailed
    instructions on how to install an SDK, which is used to develop
    applications for target hardware.

--  Reference or Conceptual Material: This type of material resides in an
-   appropriate reference manual. For example, system variables are
+-  Reference or conceptual material: This type of material resides in an
+   appropriate reference manual. As an example, system variables are
    documented in the :doc:`/ref-manual/index`.

--  Detailed Public Information Not Specific to the Yocto Project: For
-   example, exhaustive information on how to use the Source Control
-   Manager Git is better covered with Internet searches and official Git
-   Documentation than through the Yocto Project documentation.
+-  Detailed public information not specific to the Yocto Project: For
+   example, exhaustive information on how to use the Git version
+   control system is better covered with Internet searches and official Git
+   documentation than through the Yocto Project documentation.

 Other Information
 =================

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
