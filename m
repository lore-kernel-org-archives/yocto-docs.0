Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C3A9C54791
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 14:55:12 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.19141.1710341704670154327
 for <docs@lists.yoctoproject.org>;
 Wed, 13 Mar 2024 07:55:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=MfYy5MoJ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 60BB21C0007;
	Wed, 13 Mar 2024 14:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1710341702;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iLrBP2EglCii7grFsmEZbELuPQSDWSmdJeT7I8EekoQ=;
	b=MfYy5MoJVMd8SsvFjxI7K2dRGHH1em+negOTx54HG79EqrLvZGV2sYaj0Tmi32aBxKaa5p
	IxFjdnRcbAfXwcKQt1aw4qUOezk5N4zJjYqUVIV/vBVUuKwYtz359+SVn8p4fFqx/pAw9F
	usYKNsvD67mEnGN+aHET+XBd9hoCihK9R9ywJ8dJ5iaCT3D7FVQdZH236CGq7/LiG9wLFS
	RvxzgOHulcILJvQi2SZ7KSx4r+wTEemMbcE45pYAJ4Kd+mnD4wLT8VIHzoHoA4p5fTAhIT
	vQfyXQjpOni7WeHYKjotpbqI4bjeFPl2Uy4ZYq5zpqkABGnlPJmCEE+OsrIdRQ==
Message-ID: <33bd7200-85c6-44f4-8b20-09045ec36566@bootlin.com>
Date: Wed, 13 Mar 2024 15:55:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] manuals: add initial stylechecks with Vale
Content-Language: en-US
To: Quentin Schulz <foss@0leil.net>
References: <20240312210345.8832-1-michael.opdenacker@bootlin.com>
 <CB05F1E2-1F4B-4D7F-8920-D8914CB93E3D@0leil.net>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <CB05F1E2-1F4B-4D7F-8920-D8914CB93E3D@0leil.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 13 Mar 2024 14:55:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4950

Hi Quentin

I was sure the topic would interest you! Thanks for the review.

On 3/13/24 at 10:42, Quentin Schulz wrote:
> Hi Michael,
>
> On March 12, 2024 10:03:45 PM GMT+01:00, "Michael Opdenacker via lists.yoctoproject.org" <michael.opdenacker=bootlin.com@lists.yoctoproject.org> wrote:
>> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>
>> Use the "Vale" (https://vale.sh) tool to perform text style checks
>> Run "make stylecheck" to run the checks.
>>
>> This just checks the text, not the Sphinx syntax style choices.
>>
>> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>> Suggested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>>
>> ---
>>
>> See https://lwn.net/Articles/964075/ for a recent introduction.
> This is an article that requires subscription to LWN unfortunately.


Ouch, sorry for the oversight. We just have to wait until the article is 
open to everyone.

>
>> Don't hesitate to run the checks, propose fixes for the reported
>> issues and improvements to the checking rules and accepted words!
>> ---
>> documentation/.gitignore                          |  2 ++
>> documentation/.vale.ini                           |  7 +++++++
>> documentation/Makefile                            |  9 ++++++++-
>> documentation/README                              | 14 ++++++++++++++
>> documentation/standards.md                        | 15 +++++++++++++++
>> .../config/vocabularies/OpenSource/accept.txt     |  4 ++++
>> .../styles/config/vocabularies/Yocto/accept.txt   |  4 ++++
>> 7 files changed, 54 insertions(+), 1 deletion(-)
>> create mode 100644 documentation/.vale.ini
>> create mode 100644 documentation/styles/config/vocabularies/OpenSource/accept.txt
>> create mode 100644 documentation/styles/config/vocabularies/Yocto/accept.txt
>>
>> diff --git a/documentation/.gitignore b/documentation/.gitignore
>> index 494b4f4de5..b23d598054 100644
>> --- a/documentation/.gitignore
>> +++ b/documentation/.gitignore
>> @@ -7,3 +7,5 @@ releases.rst
>> .vscode/
>> */svg/*.png
>> */svg/*.pdf
>> +styles/*
>> +!styles/config
>> diff --git a/documentation/.vale.ini b/documentation/.vale.ini
>> new file mode 100644
>> index 0000000000..02042bb632
>> --- /dev/null
>> +++ b/documentation/.vale.ini
>> @@ -0,0 +1,7 @@
>> +StylesPath = styles
>> +MinAlertLevel = suggestion
>> +Packages = RedHat, proselint, write-good, alex, Readability, Joblint
>> +Vocab = Yocto, OpenSource
>> +[*.rst]
>> +BasedOnStyles = Vale, RedHat, proselint, write-good, alex, Readability, Joblint
>> +
>> diff --git a/documentation/Makefile b/documentation/Makefile
>> index 9fb6814c8f..e1b61f17f1 100644
>> --- a/documentation/Makefile
>> +++ b/documentation/Makefile
>> @@ -5,6 +5,9 @@
>> # from the environment for the first two.
>> SPHINXOPTS    ?= -W --keep-going -j auto
>> SPHINXBUILD   ?= sphinx-build
>> +# Release notes are excluded because they contain contributor names and commit messages which can't be modified
>> +VALEOPTS      ?= --no-wrap --no-wrap --glob '!migration-guides/release-notes-*.rst'
> Do we really need `--no-wrap` twice here?


Oops, fixed.

>
> [...]
>
>> diff --git a/documentation/standards.md b/documentation/standards.md
>> index 9f4771ebd9..a4f8be0dcf 100644
>> --- a/documentation/standards.md
>> +++ b/documentation/standards.md
>> @@ -5,6 +5,21 @@ documentation is created.
>>
>> It is currently a work in progress.
>>
>> +## Automatic style validation
>> +
>> +There is an ongoing effort to automate style validation
>> +through the [Vale](https://vale.sh/). To try it, run:
>> +
>> +    $ make vale
>> +
> Isn't this supposed to be `make stylecheck` here?

Oops, fixed too.

>
>> +Note that this just applies to text. Therefore, the syntax
>> +conventions described below still apply.
>> +
>> +If you wish to add words to the "accept.txt" files
>> +(./styles/config/vocabularies/<Vocab>/accept.txt),
>> +make sure the spelling and capitalization matches
>> +what Wikipedia uses. Wikipedia is our reference!
>> +
>> ## Text standards
>>
>> ### Bulleted lists
>> diff --git a/documentation/styles/config/vocabularies/OpenSource/accept.txt b/documentation/styles/config/vocabularies/OpenSource/accept.txt
>> new file mode 100644
>> index 0000000000..98e76ae1f5
>> --- /dev/null
>> +++ b/documentation/styles/config/vocabularies/OpenSource/accept.txt
>> @@ -0,0 +1,4 @@
>> +ftrace
>> +toolchain
>> +systemd
>> +LTTng
> Are those strings matched even when they are highlighted with simple/double tick quotes? If not, that could be a way to not have to expand this list too often and also it's nice to highlight the name of pieces of SW (well, excluding toolchain from my remark obviously).


I've just checked by adding a typo, like "Yotco", and found out that:

- ``Yotco`` is not reported

- But "Yotco" is

So, yes, using "``" allows to write any string we want, and the tool 
won't check such strings. So, this avoids lots of false positives and 
this can actually help to locate instances when such double quotes are 
missing!

An issue though. If I add "Yotco" to one of the variable definitions in 
ref-manual/variables.rst, the typo remains unnoticed! Adding this to my 
issue list...

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


