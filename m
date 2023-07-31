Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 237F6C001DF
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 09:34:06 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.3709.1690796042341975021
 for <docs@lists.yoctoproject.org>;
 Mon, 31 Jul 2023 02:34:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=O2Nss9/I;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4D27520007;
	Mon, 31 Jul 2023 09:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690796040;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cvo1H3eI4d0Gj3tBZDshhXUOPCoAxhi+cWrKdhkUgq0=;
	b=O2Nss9/I24zBxaW8o8xQC0V6OOQfFrPm6fuNLMJ/i1Uq76oC7g7T7ltVXsCHyOp1W5aW5/
	D3rkRmcgk98fUh0R5+uHMOLK8UyoI/T7YrOUNKdSKyxu/c7qeWmSmenuQJYyodOJuZKRaY
	0Cz6ZjhO6I2MZaAHPQPmJPdeOea6DrHFO29cOx7/hFULuGfa/pltaFOAh3g+96OXlXSzSz
	pxENYpqsMm98d0Vs1eFRraB1gL+wEqu/rwpPvyadpyfscKNMtzYRPAJxGqra1TpvxlT5F7
	/nfz91QJulh4CGfvAyeGBmcWvBIt12MEPX+kazYm3jBFO9hxxiEcLEh3zbtDMQ==
Message-ID: <e09dcd0c-cb28-91a7-8e8a-0796b2c4e0ec@bootlin.com>
Date: Mon, 31 Jul 2023 11:33:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Cc: docs@lists.yoctoproject.org, Alexander Kanavin <alex@linutronix.de>,
 Alexander Kanavin <alex.kanavin@gmail.com>
Subject: Re: [docs] [PATCH] ref-manual: document image-specific variant of
 INCOMPATIBLE_LICENSE
Content-Language: en-US
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
References: <20230728165026.862640-1-alex@linutronix.de>
 <ae535037-9245-66aa-c71a-cb4e6fe70454@theobroma-systems.com>
 <CANNYZj_vV3pwbPhN3geFdBuBLKM+X1jFAt4nHdyzqNyTZatDZA@mail.gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <CANNYZj_vV3pwbPhN3geFdBuBLKM+X1jFAt4nHdyzqNyTZatDZA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 31 Jul 2023 09:34:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4089


On 31.07.23 at 11:21, Alexander Kanavin wrote:
> That's right. Needs to be fixed. Michael, can you squash the fixup in
> master-next please?
>
> Alex
>
> On Mon, 31 Jul 2023 at 11:11, Quentin Schulz
> <quentin.schulz@theobroma-systems.com> wrote:
>> Hi Alex,
>>
>> On 7/28/23 18:50, Alexander Kanavin via lists.yoctoproject.org wrote:
>>> This has been around without being properly documented since 2019 (!!!),
>>> and is nowadays the preferred method for enforcing license restrictions,
>>> especially since meta-gplv2 is officially obsolete.
>>>
>>> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>>> ---
>>>    documentation/ref-manual/images.rst    | 16 +++++++++-------
>>>    documentation/ref-manual/variables.rst | 13 +++++++++++--
>>>    2 files changed, 20 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/documentation/ref-manual/images.rst b/documentation/ref-manual/images.rst
>>> index d3aeb0829..19c31e0fc 100644
>>> --- a/documentation/ref-manual/images.rst
>>> +++ b/documentation/ref-manual/images.rst
>>> @@ -14,15 +14,17 @@ image you want.
>>>       Building an image without GNU General Public License Version 3
>>>       (GPLv3), GNU Lesser General Public License Version 3 (LGPLv3), and
>>>       the GNU Affero General Public License Version 3 (AGPL-3.0) components
>>> -   is only supported for minimal and base images. Furthermore, if you
>>> -   are going to build an image using non-GPLv3 and similarly licensed
>>> -   components, you must make the following changes in the ``local.conf``
>>> -   file before using the BitBake command to build the minimal or base
>>> -   image:
>>> +   is only tested for core-image-minimal image. Furthermore, if you would like to
>>> +   build an image and verify that it does not include GPLv3 and similarly licensed
>>> +   components, you must make the following changes in the image recipe
>>> +   file before using the BitBake command to build the image:
>>>
>>> -   #. Comment out the :term:`EXTRA_IMAGE_FEATURES` line
>>> +       INCOMPATIBLE_LICENSE = "GPL-3.0* LGPL-3.0*"
>>>
>>> -   #. Set :term:`INCOMPATIBLE_LICENSE` to "GPL-3.0* LGPL-3.0* AGPL-3.0*"
>>> +   Alternatively, you can adjust ``local.conf`` file, repeating and adjusting the line
>>> +   for all images where the license restriction must apply:
>>> +
>>> +       INCOMPATIBLE_LICENSE:pn:your-image-name = "GPL-3.0* LGPL-3.0*"
>>>
>> I believe there's a typo here in the override and we should read:
>>
>> INCOMPATIBLE_LICENSE:pn-your-image-name = "GPL-3.0* LGPL-3.0*"
>>
>> (note the `:` transformed into `-`).
>>
>> Is this a correct assumption?


Sure, done.
Thanks Quentin for the review!
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


