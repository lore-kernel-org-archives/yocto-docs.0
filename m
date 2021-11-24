Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FA29C433EF
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 20:57:14 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.3920.1637787433354167148
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Nov 2021 12:57:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 1D426C0007;
	Wed, 24 Nov 2021 20:57:05 +0000 (UTC)
Subject: Re: [docs] [honister][PATCH] documentation: prepare for 3.4.1 release
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: Anuj Mittal <anuj.mittal@intel.com>, docs@lists.yoctoproject.org
References: <20211124150928.11645-1-anuj.mittal@intel.com>
 <16BA84AC7B404D44.11456@lists.yoctoproject.org>
Organization: Bootlin
Message-ID: <3cf9ec30-d44f-f35d-fbb2-d118e3e2d5f8@bootlin.com>
Date: Wed, 24 Nov 2021 21:57:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <16BA84AC7B404D44.11456@lists.yoctoproject.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Nov 2021 20:57:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2199

Hello,

On 11/24/21 4:21 PM, Michael Opdenacker wrote:
> Hi Anuj,
>
> On 11/24/21 4:09 PM, Anuj Mittal wrote:
>> Also include reference to just release 3.3.4.
>>
>> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
>> ---
>>  documentation/conf.py      |  2 +-
>>  documentation/poky.yaml    | 10 +++++-----
>>  documentation/releases.rst |  2 ++
>>  3 files changed, 8 insertions(+), 6 deletions(-)
>>
>> diff --git a/documentation/conf.py b/documentation/conf.py
>> index 104b49ea0..9fd836a35 100644
>> --- a/documentation/conf.py
>> +++ b/documentation/conf.py
>> @@ -16,7 +16,7 @@ import os
>>  import sys
>>  import datetime
>>  
>> -current_version = "3.4"
>> +current_version = "3.4.1"
>>  
>>  # String used in sidebar
>>  version = 'Version: ' + current_version
>> diff --git a/documentation/poky.yaml b/documentation/poky.yaml
>> index f2d1e8b97..11e209e30 100644
>> --- a/documentation/poky.yaml
>> +++ b/documentation/poky.yaml
>> @@ -1,12 +1,12 @@
>> -DISTRO : "3.4"
>> +DISTRO : "3.4.1"
>>  DISTRO_NAME_NO_CAP : "honister"
>>  DISTRO_NAME : "Honister"
>>  DISTRO_NAME_NO_CAP_MINUS_ONE : "hardknott"
>>  DISTRO_NAME_NO_CAP_LTS : "dunfell"
>> -YOCTO_DOC_VERSION : "3.4"
>> -YOCTO_DOC_VERSION_MINUS_ONE : "3.3.3"
>> -DISTRO_REL_TAG : "yocto-3.4"
>> -POKYVERSION : "26.0.0"
>> +YOCTO_DOC_VERSION : "3.4.1"
>> +YOCTO_DOC_VERSION_MINUS_ONE : "3.3.4"
>> +DISTRO_REL_TAG : "yocto-3.4.1"
>> +POKYVERSION : "26.0.1"
>>  YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
>>  YOCTO_DL_URL : "https://downloads.yoctoproject.org"
>>  YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
>> diff --git a/documentation/releases.rst b/documentation/releases.rst
>> index 529d00e70..6f7bca540 100644
>> --- a/documentation/releases.rst
>> +++ b/documentation/releases.rst
>> @@ -9,6 +9,7 @@ Release Series 3.4 (honister)
>>  ******************************
>>  
>>  - :yocto_docs:`3.4 Documentation </3.4>`
>> +- :yocto_docs:`3.4.1 Documentation </3.4.1>`
>>  
>>  ******************************
>>  Release Series 3.3 (hardknott)
>> @@ -18,6 +19,7 @@ Release Series 3.3 (hardknott)
>>  - :yocto_docs:`3.3.1 Documentation </3.3.1>`
>>  - :yocto_docs:`3.3.2 Documentation </3.3.2>`
>>  - :yocto_docs:`3.3.3 Documentation </3.3.3>`
>> +- :yocto_docs:`3.3.4 Documentation </3.3.4>`
>>  
>>  *******************************
>>  Release Series 3.2 (gatesgarth)
>
> Many thanks for these updates!
> Just to be sure... when do you expect me to merge these changes?
> Before the release so that everything is all set in the docs when the
> release is out?
> Or right after the release is made so that the docs don't refer to a
> release that is not available yet?


I guess that the second option (waiting for the release) is the correct one.

I'm saying this because I updated releases.rst too early on master, to
include the 3.1.12 release, and this causes issues:

  * Go to https://docs.yoctoproject.org/releases.html
  * Click on https://docs.yoctoproject.org/3.1.12 -> Not found
  * Click on https://docs.yoctoproject.org/3.1.11/ -> You get a red
    warning: "This document is for outdated version 3.1.11, you should
    select the latest release version in this series, 3.1.12.". This is
    wrong because the 3.1.12 manual is not available yet, because we
    don't have the "yocto-3.1.12" tag yet, right?

So, I'd even say that the first line for this patch should be
"documentation: update for 3.4.1 release" ("update" instead of
"prepare"), if I'm supposed to apply it after the release is out.

Please correct me if I'm wrong. Sorry for the time it took me to (start
to) understand the process to generate docs.
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


