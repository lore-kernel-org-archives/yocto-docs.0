Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF4A7C433F5
	for <webhook@archiver.kernel.org>; Mon, 14 Feb 2022 16:57:04 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.36615.1644857822780958037
 for <docs@lists.yoctoproject.org>;
 Mon, 14 Feb 2022 08:57:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=LmPEfTeg;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7654C40007;
	Mon, 14 Feb 2022 16:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1644857820;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zIZb5zUE0ATsNR6qBUMEy92TFqOI0GoAVsgFlYZ8ixg=;
	b=LmPEfTegsckRVjWatI9xIs4Rvc76il46VwdmnsuvAXNlnR2x0UC7qh884jhmFgwDXcXU5q
	adIhxrM7kkz34GHAvWjiSMFUG8rDGokLuK4mG3kHX2wgOgU6cPxkJ6t/yTgIH3MPUwAh1z
	IsgTHe9FkmP6AaN1jEQkzVH0frjGF8cB8akP32IcUaSITyQaBCEWXI8uNACztUMQBDuPLP
	KhytToMNSvTBWD4xy+f0Utl8FRRJKeBFspLGs9S5JmQiYjSoBvArohucCpuo0kt1W/6NDm
	VT1QljUK6W0HyTadlxAkXIrGqs+OLliQzrbGPxteqsZCafBL/lbmeOiusMIDIA==
Message-ID: <56b1cc0f-9947-7104-1cd3-8bd1d01a946c@bootlin.com>
Date: Mon, 14 Feb 2022 17:56:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [docs] [PATCH v2] documentation: Update for skip_recipe rename
Content-Language: en-US
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
 Saul Wold <Saul.Wold@windriver.com>,
 "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
References: <20220204202258.141312-1-saul.wold@windriver.com>
 <9dbeeadb51714b6b97e9f7972dd06307@axis.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <9dbeeadb51714b6b97e9f7972dd06307@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 14 Feb 2022 16:57:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2466

Saul, Peter, Quentin,

Thank you for the patch and reviews.

On 2/7/22 16:43, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: docs@lists.yoctoproject.org <docs@lists.yoctoproject.org> On Behalf Of Saul Wold
>> Sent: den 4 februari 2022 21:23
>> To: docs@lists.yoctoproject.org
>> Cc: Saul Wold <saul.wold@windriver.com>
>> Subject: [docs] [PATCH v2] documentation: Update for skip_recipe rename
>>
>> This change better aligns the name of the variable with it's
>> purpose. Since we removed the odler class, the associated
> odler -> older
>
>> documentation is also removed.
>>
>> Signed-off-by: Saul Wold <saul.wold@windriver.com>
>> ---
>>  .../migration-guides/migration-3.5.rst        |  8 +++++++
>>  documentation/ref-manual/classes.rst          | 17 -------------
>>  documentation/ref-manual/variables.rst        | 24 +++++++++----------
>>  3 files changed, 20 insertions(+), 29 deletions(-)
>>
>> diff --git a/documentation/migration-guides/migration-3.5.rst b/documentation/migration-guides/migration-3.5.rst
>> index 8c2a7d2c65..29ce6fe14b 100644
>> --- a/documentation/migration-guides/migration-3.5.rst
>> +++ b/documentation/migration-guides/migration-3.5.rst
>> @@ -54,3 +54,11 @@ Recipe changes
>>  - :ref:`allarch <ref-classes-allarch>` packagegroups can no longer depend on packages
>>    which use :term:`PKG` renaming such as :ref:`ref-classes-debian`.
>>
>> +bbclass changes
>> +---------------
>> +
>> +- blacklist.bbclass is removed and the fucntionality moved to base.bbclass
> fucntionality -> functionality
>
>> +  with a more descriptive ``varflag`` named SKIP_RECIPE which will use the
>> +  SkipRecipe() function. The usage will remain the same:
>> +
>> +        SKIP_RECIPE[my-recipe] = "Reason for skipping recipe"
>> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
>> index 949217bf42..8444fa4621 100644
>> --- a/documentation/ref-manual/classes.rst
>> +++ b/documentation/ref-manual/classes.rst
>> @@ -208,23 +208,6 @@ scripts to be disabled should be specified using the
>>  :term:`BINCONFIG` variable within the recipe inheriting
>>  the class.
>>
>> -.. _ref-classes-blacklist:
>> -
>> -``blacklist.bbclass``
>> -=====================
>> -
>> -The ``blacklist`` class prevents the OpenEmbedded build system from
>> -building specific recipes. To use this class, inherit
>> -the class globally and set :term:`PNBLACKLIST` for
>> -each recipe you wish to ignore. Specify the :term:`PN`
>> -value as a variable flag (varflag) and provide a reason, which is
>> -reported, if the package is requested to be built as the value. For
>> -example, if you want to ignore a recipe called "exoticware", you
>> -add the following to your ``local.conf`` or distribution configuration::
>> -
>> -   INHERIT += "blacklist"
>> -   PNBLACKLIST[exoticware] = "Not supported by our organization."
>> -
>>  .. _ref-classes-buildhistory:
>>
>>  ``buildhistory.bbclass``
>> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
>> index d4f40b6929..23f55b1d67 100644
>> --- a/documentation/ref-manual/variables.rst
>> +++ b/documentation/ref-manual/variables.rst
>> @@ -5683,18 +5683,6 @@ system and gives an overview of their function and contents.
>>        packages for the target and for Multilib, :term:`PN` would be ``bash``
>>        and ``lib64-bash``, respectively.
>>
>> -   :term:`PNBLACKLIST`
>> -      Lists recipes you do not want the OpenEmbedded build system to build.
>> -      This variable works in conjunction with the
>> -      :ref:`blacklist <ref-classes-blacklist>` class, which is inherited
>> -      globally.
>> -
>> -      To prevent a recipe from being built, use the :term:`PNBLACKLIST`
>> -      variable in your ``local.conf`` file. Here is an example that
>> -      prevents ``myrecipe`` from being built::
>> -
>> -         PNBLACKLIST[myrecipe] = "Not supported by our organization."
>> -
>>     :term:`POPULATE_SDK_POST_HOST_COMMAND`
>>        Specifies a list of functions to call once the OpenEmbedded build
>>        system has created the host part of the SDK. You can specify
>> @@ -6929,6 +6917,18 @@ system and gives an overview of their function and contents.
>>
>>           SKIP_FILEDEPS = "1"
>>
>> +   :term:`SKIP_RECIPE`
>> +      Used to prevent the OpenEmbedded build system from building a given
>> +      recipe. Specify the :term:`PN` value as a variable flag (``varflag``)
>> +      and provide a reason, which will be reported when attempting to
>> +      build the recipe.
>> +
>> +      To prevent a recipe from being built, use the :term:`SKIP_RECIPE`
>> +      variable in your ``local.conf`` file or distribution configuration.
>> +      Here is an example which prevents ``myrecipe`` from being built::
>> +
>> +         SKIP_RECIPE[myrecipe] = "Not supported by our organization."
>> +
>>     :term:`SOC_FAMILY`
>>        Groups together machines based upon the same family of SOC (System On
>>        Chip). You typically set this variable in a common ``.inc`` file that
>> --
>> 2.31.1


I checked that the V2 takes Quentin's feedback into account and I took
care of implementing the fixes reported by Peter, along with a few extra
improvements.
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
That's merged in master-next now.

Thanks again!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


