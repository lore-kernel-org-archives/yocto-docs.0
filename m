Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.27114.1623657102057312148
 for <docs@lists.yoctoproject.org>;
 Mon, 14 Jun 2021 00:51:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 2A08520005;
	Mon, 14 Jun 2021 07:51:39 +0000 (UTC)
Cc: Quentin Schulz <quentin.schulz@streamunlimited.com>
Subject: Re: [docs] [PATCH 0/2] Fixups for glossary
To: Daniel Wagenknecht <dwagenknecht@emlix.com>, docs@lists.yoctoproject.org
References: <20210614053013.68669-1-dwagenknecht@emlix.com>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <51fef711-fb9c-ce09-0018-9cbd15a9a99b@bootlin.com>
Date: Mon, 14 Jun 2021 09:51:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210614053013.68669-1-dwagenknecht@emlix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Daniel,

On 6/14/21 7:30 AM, Daniel Wagenknecht wrote:
> Did some fixups as suggested by Quentin.
>
> On Fri, 2021-06-11 at 19:20 +0200, Quentin Schulz wrote:
>>>           IMAGE_CMD_jffs2 = "mkfs.jffs2 --root=${IMAGE_ROOTFS} \
>>> -             --faketime --output=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 \
>>> +             --faketime --output=${IMGDEPLOYDIR}/${IMAGE_NAME}.rootfs.jffs2 \
>>>               ${EXTRA_IMAGECMD}"
>> It'd be awesome if you could do a follow-up patch here since this isn't the actual
>> content of this variable anymore.
> done
>
>> IMAGE_MANIFEST isn't in this class anymore, it'd be great again if you
>> could send a follow-up patch for this.
> done
>
>> On a side note: you should have added the term in the glossary (from patch 2)
>> first, because technically this commit does not build.
> will keep in mind next time.
>
> Thanks for taking a thorough look at the changes and what was still
> missing. Great work you are all doing with the documentation!
>
> Best Wishes
>   Daniel
>
> Daniel Wagenknecht (2):
>   ref-manual: variables: fixup example in IMAGE_CMD
>   ref-manual: variables: fixup class reference in IMAGE_MANIFEST
>
>  documentation/ref-manual/variables.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)


Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Many thanks for these updates! I merged them into the "master-next"
branch of yocto-docs.

Cheers,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

