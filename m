Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DF52C77B7C
	for <webhook@archiver.kernel.org>; Fri, 12 May 2023 08:32:21 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.19123.1683880332545071119
 for <docs@lists.yoctoproject.org>;
 Fri, 12 May 2023 01:32:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=iF22n/sB;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E7972FF809;
	Fri, 12 May 2023 08:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1683880330;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uVjYrPxcy94grJkBLPXMTwKBP1ZsSdHA5WzpBU0qbgo=;
	b=iF22n/sBSr7eXIF77xFTM47QgVgBs4IqKdH7L+iV1V+Q7B0t6rMyklssOwJijM4PuqqbS3
	+jW20WBMrNOuDY1cV378HDsYWTfxz8ICfOoOAILh7SZ5N59xmGfzBBIgoK5CUd0QX7fLCt
	GhZPK7FEnMmbR+QodZzuYlaTrOwxZ4un1kNsTGLd132Xy+BIZ3ViF4+rAnK/1pCKS6En6/
	2nhYtvRiBSfyasZW++IgdMvFZnSQdBRaxiIUkimQiHITAcSrUlnr7N3n6MTgKMX6sIRCBb
	8H1GuCD6guVPFqCybCHfFVQZ142q4N+79SI4Ike5QvkMS3Ufc+54acbdAkA7kw==
Message-ID: <3de531a1-29ab-6863-b3d4-1a8782350cc9@bootlin.com>
Date: Fri, 12 May 2023 10:32:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] migration-guides: add release-notes for 4.1.4
Content-Language: en-US
To: Lee Chee Yang <chee.yang.lee@intel.com>
References: <20230512075536.393334-1-chee.yang.lee@intel.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20230512075536.393334-1-chee.yang.lee@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 12 May 2023 08:32:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3936

Hi Lee,

On 12.05.23 at 09:55, Lee Chee Yang wrote:
> From: Lee Chee Yang <chee.yang.lee@intel.com>
>
> Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
> ---
>   .../migration-guides/release-4.1.rst          |   1 +
>   .../migration-guides/release-notes-4.1.4.rst  | 254 ++++++++++++++++++
>   2 files changed, 255 insertions(+)
>   create mode 100644 documentation/migration-guides/release-notes-4.1.4.rst
>
> diff --git a/documentation/migration-guides/release-4.1.rst b/documentation/migration-guides/release-4.1.rst
> index dbca7c7e0..7d1ce95e2 100644
> --- a/documentation/migration-guides/release-4.1.rst
> +++ b/documentation/migration-guides/release-4.1.rst
> @@ -10,3 +10,4 @@ Release 4.1 (langdale)
>      release-notes-4.1.1
>      release-notes-4.1.2
>      release-notes-4.1.3
> +   release-notes-4.1.4


Many thanks for the new release notes.
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
(I'm checking all the CVE links!)

Merged in master-next.
Thanks again,
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


