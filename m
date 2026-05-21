Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4E8FCD4F3D
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 14:40:51 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38069.1779374442592904292
 for <docs@lists.yoctoproject.org>;
 Thu, 21 May 2026 07:40:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=D6FzIvV0;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=zvQ5DMubupYxalwaYMvlobWniKD0XczDUdnDsyvCn9U=; b=D6FzIvV02nr252CvBFKudT0yB4
	PuVK9RvoVBaBb2NHN7VwnbwvH652JbAx4btU9MgX6TEoAndjG+LZ09yu5/EqX0/PP3vXiNNX801qe
	JldwHsRWW0tPDZZXqkz3g3QC5tl0DUOctKI1OmoOkxLKoUDtPlhoUfNL3T8t+xeQTAD5F1/+Bz8yN
	nWj8Vffqz2AEXBXMcIA0kamoRQwoUWV2HLhd82rOD2lHlx6xD0p04US5UNpj6YZHL6xup1C6PGQUC
	DYFDTrCXarhosBRXquF08Y0jwOGO5aw2U3QHEFD9omOPQcANXZmLTO9YequwPoxStJy3P71QCSPqL
	mDvPpn5A==;
Received: from [147.129.179.166] (port=38456 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wQ4Zg-00000002qy4-04wu
	for docs@lists.yoctoproject.org;
	Thu, 21 May 2026 10:40:41 -0400
Date: Thu, 21 May 2026 10:44:01 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: I am confused by the combination of using "?=" and an override
Message-ID: <18fea83f-44b6-2034-cb65-93044c010c14@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 21 May 2026 14:40:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9517


  I may have totally misunderstood something basic all this time, but
this seems like something that needs a clearer explanation if it's not
explained forcefully.

  In a current build, I set a debugging variable thusly in my
local.conf:

  ST_OPTEE_CORE_DEBUG = "y"

assuming that any ST-layer processing would honour the fact that I
explicitly gave it a value. However, when I checked the eventual
value:

$ bitbake-getvar -r optee-os-stm32mp ST_OPTEE_CORE_DEBUG
#
# $ST_OPTEE_CORE_DEBUG [3 operations]
#   set /home/rpjday/BOARDS/nexus/wrynose/build/conf/local.conf:14
#     "y"
#   set
/home/rpjday/Layers/wrynose/st/meta-st-stm32mp/recipes-security/optee/optee-os-stm32mp-common.inc:37
#     [_defaultval] "y"
#   override[stm32mp15common]:set?
/home/rpjday/Layers/wrynose/st/meta-st-stm32mp/recipes-security/optee/optee-os-stm32mp-common.inc:38
#     "n"
# pre-expansion value:
#   "n"
ST_OPTEE_CORE_DEBUG="n"


  Huh? That output clearly shows that I set the value first, but it
was set back based on these two lines in that file:

ST_OPTEE_CORE_DEBUG ??= "y"
ST_OPTEE_CORE_DEBUG:stm32mp15common ?= "n"

Apparently, even though I set the variable myself, that override
assignment was setting it back to "n" -- not what I expected even
though that override was in effect.

  On a hunch, I used this assignment instead:

ST_OPTEE_CORE_DEBUG:stm32mp15common = "y"

and it worked:

# $ST_OPTEE_CORE_DEBUG [3 operations]
#   set
/home/rpjday/Layers/wrynose/st/meta-st-stm32mp/recipes-security/optee/optee-os-stm32mp-common.inc:37
#     [_defaultval] "y"
#   override[stm32mp15common]:set
/home/rpjday/BOARDS/nexus/wrynose/build/conf/local.conf:13
#     "y"
#   override[stm32mp15common]:set?
/home/rpjday/Layers/wrynose/st/meta-st-stm32mp/recipes-security/optee/optee-os-stm32mp-common.inc:38
#     "n"
# pre-expansion value:
#   "y"
ST_OPTEE_CORE_DEBUG="y"


That is *not* what I expected -- I thought that once I assigned a
value to that variable, no combination of "?=" or "??=" assignments
could affect it, but apparently I was wrong.

  Is this the expected behaviour? Because it caught me by surprise,
and if this is the way it works, it definitely needs to be documented.

rday

