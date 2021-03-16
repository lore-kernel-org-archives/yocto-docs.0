Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web10.1732.1615911996267913733
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Mar 2021 09:26:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:55420 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lMCWg-00Gjjq-CW
	for docs@lists.yoctoproject.org; Tue, 16 Mar 2021 12:26:35 -0400
Date: Tue, 16 Mar 2021 12:26:31 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: any continuing value in BUILDSDK_CC_ARCH?
Message-ID: <e556c1c5-9b1e-8167-ecac-88793ebb7f1@crashcourse.ca>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
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


  here in ref manual variables glossary:

http://docs.yoctoproject.org/ref-manual/variables.html#term-HOST_CC_ARCH

the third variable listed there, BUILDSDK_CC_ARCH, is not set up as a
link, and i see no current use of it. i do see that, in july of 2019,
the last(?) use of it was removed:

commit 02b01280c0cc1e426d0cd9210c4bcd1f95977ab2
Author: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Date:   Mon Jul 15 13:25:49 2019 +0200

    nativesdk-meson: Remove some unused variables

    Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-devtools/meson/nativesdk-meson_0.50.1.bb
b/meta/recipes-devtools/meson/nativesdk-meson_0.50.1.bb
index 1549357a55..1756f342ce 100644
--- a/meta/recipes-devtools/meson/nativesdk-meson_0.50.1.bb
+++ b/meta/recipes-devtools/meson/nativesdk-meson_0.50.1.bb
@@ -16,11 +16,6 @@ def meson_endian(prefix, d):
     else:
         bb.fatal("Cannot determine endianism for %s-%s" % (arch, os))

-MESON_TOOLCHAIN_ARGS = "${BUILDSDK_CC_ARCH}${TOOLCHAIN_OPTIONS}"
-MESON_C_ARGS = "${MESON_TOOLCHAIN_ARGS} ${BUILDSDK_CFLAGS}"
-MESON_CPP_ARGS = "${MESON_TOOLCHAIN_ARGS} ${BUILDSDK_CXXFLAGS}"
-MESON_LINK_ARGS = "${MESON_TOOLCHAIN_ARGS} ${BUILDSDK_LDFLAGS}"
-

  is that variable still hanging around anywhere?

rday
