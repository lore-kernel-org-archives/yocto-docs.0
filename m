Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web10.1926.1630230156160875981
 for <docs@lists.yoctoproject.org>;
 Sun, 29 Aug 2021 02:42:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpe08a7c099a2b1-cm08a7c099a2af.cpe.net.cable.rogers.com ([174.114.56.109]:42690 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mKHKk-0004IC-7N
	for docs@lists.yoctoproject.org; Sun, 29 Aug 2021 05:42:35 -0400
Date: Sun, 29 Aug 2021 05:42:31 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] dev-manual: emphasize that new layers live outside of poky
Message-ID: <e080c70-2cec-7e94-8fe3-ea6e25c3839c@crashcourse.ca>
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

Tweak the bblayers.conf example to encourage the reader to appreciate
that any new layers should not share space with the official Poky
checkout.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 4a5011ea7..c23f8e09c 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -422,8 +422,9 @@ Before the OpenEmbedded build system can use your new layer, you need to
 enable it. To enable your layer, simply add your layer's path to the
 :term:`BBLAYERS` variable in your ``conf/bblayers.conf`` file, which is
 found in the :term:`Build Directory`.
-The following example shows how to enable a layer named
-``meta-mylayer``::
+The following example shows how to enable your new
+``meta-mylayer`` layer (note how your new layer exists outside of
+the official ``poky`` repository which you would have checked out earlier)::

    # POKY_BBLAYERS_CONF_VERSION is increased each time build/conf/bblayers.conf
    # changes incompatibly
@@ -434,7 +435,7 @@ The following example shows how to enable a layer named
        /home/user/poky/meta \
        /home/user/poky/meta-poky \
        /home/user/poky/meta-yocto-bsp \
-       /home/user/poky/meta-mylayer \
+       /home/user/mystuff/meta-mylayer \
        "

 BitBake parses each ``conf/layer.conf`` file from the top down as

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
