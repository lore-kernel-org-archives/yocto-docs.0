Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web08.3081.1630401449514590357
 for <docs@lists.yoctoproject.org>;
 Tue, 31 Aug 2021 02:17:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:56252 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mKztY-0005Nc-Vr
	for docs@lists.yoctoproject.org; Tue, 31 Aug 2021 05:17:28 -0400
Date: Tue, 31 Aug 2021 05:17:24 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: is dev manual section on EXTERNAL_TOOLCHAIN out of date?
Message-ID: <b54339cc-f831-44e5-32d9-33a2b6123d79@crashcourse.ca>
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


here:

https://docs.yoctoproject.org/dev-manual/common-tasks.html#optionally-using-an-external-toolchain

there is a reference to the EXTERNAL_TOOLCHAIN variable, but
currently, there's not a lot of usage of that in OE:


meta/conf/bitbake.conf:    CCACHE_DIR EXTERNAL_TOOLCHAIN CCACHE
CCACHE_NOHASHDIR LICENSE_PATH SDKPKGSUFFIX \

meta/classes/cmake.bbclass:set( CMAKE_FIND_ROOT_PATH
${STAGING_DIR_HOST} ${STAGING_DIR_NATIVE} ${CROSS_DIR}
${OECMAKE_PERLNATIVE_DIR} ${OECMAKE_EXTRA_ROOT_PATH}
${EXTERNAL_TOOLCHAIN} ${HOSTTOOLS_DIR})

meta/classes/icecc.bbclass:    external_toolchain_bindir =
d.expand('${EXTERNAL_TOOLCHAIN}${bindir_cross}')


more to the point, while there *might* be some value in a developer
using an external (vendor-supplied) toolchain, i would think we should
promote building one's own with "-c populate_sdk" if possible.

  in any event, that section seems out of date, but i could be wrong.

rday
