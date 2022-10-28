Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEFA8ECAAA1
	for <webhook@archiver.kernel.org>; Fri, 28 Oct 2022 14:55:36 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web08.429.1666968928019135311
 for <docs@lists.yoctoproject.org>;
 Fri, 28 Oct 2022 07:55:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=mFOcR2O2;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 8AC90100005;
	Fri, 28 Oct 2022 14:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666968926;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V/4kQI3e7RSsEZx+LeGmwiTil4udx7Stq85izxau+1o=;
	b=mFOcR2O2w1e0Fpbq2uBtaPL7ZUTAeDAIR+7Pyoe1hWjrSvw7aTTKeC94xGPqHA278CqBpd
	SI3qKkMZdPo3x27Juuzlo09CWYiMWnOlVAIjTPFth90X5RZEW3SRZQyeK0nE1mHp13YtfJ
	56p+JKbkVD0590PJb32MTy+6l6P8BMdNdzY3i55hBA4WIfHyA1nrQ5kX3uM0aSQXEsqEtU
	JgWY6ORh0cnMCEvGafy+GyPkQNLKOntiRaIPcKdfG1v/8D8PGW5ULQ1vMB9V36SBGD9PlR
	QmDrEkCmj3t8X+a+AEmbtZb0F9+oQuE9vsvrY1nFZKqGLsQ/0cDqdmcspUD3Tw==
Message-ID: <740f553c-5154-e5b5-1345-7c55ba40916f@bootlin.com>
Date: Fri, 28 Oct 2022 16:55:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 3/5] dev-manual: common-tasks.rst: add section
 about SPDX / SBOM generation
Content-Language: en-US
To: Mikko Rapeli <mikko.rapeli@linaro.org>
References: <20221028101939.93195-1-michael.opdenacker@bootlin.com>
 <20221028101939.93195-4-michael.opdenacker@bootlin.com>
 <Y1u3iSS1h8PUJp6y@nuoska>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <Y1u3iSS1h8PUJp6y@nuoska>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 28 Oct 2022 14:55:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3441

Hi Mikko

Many thanks for the review!

On 10/28/22 13:05, Mikko Rapeli wrote:
> Hi,
>
> On Fri, Oct 28, 2022 at 12:19:37PM +0200, Michael Opdenacker via lists.yoctoproject.org wrote:
>> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>
>> Also stop refering to the meta-spdxscanner class, no longer
>> relevant.
>>
>> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>> ---
>>   documentation/dev-manual/common-tasks.rst | 96 ++++++++++++++---------
>>   1 file changed, 61 insertions(+), 35 deletions(-)
>>
>> diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
>> index 25d7edbc29..263a1d302b 100644
>> --- a/documentation/dev-manual/common-tasks.rst
>> +++ b/documentation/dev-manual/common-tasks.rst
>> @@ -11236,8 +11236,6 @@ to be covered by assuming that there are three main areas of concern:
>>   -  Compilation scripts and modifications to the source code must be
>>      provided.
>>   
>> --  spdx files can be provided.
>> -
>>   There are other requirements beyond the scope of these three and the
>>   methods described in this section (e.g. the mechanism through which
>>   source code is distributed).
>> @@ -11429,39 +11427,6 @@ layers (recipes, configuration files, and so forth) enables you to meet
>>   your requirements to include the scripts to control compilation as well
>>   as any modifications to the original source.
>>   
>> -Providing spdx files
>> -~~~~~~~~~~~~~~~~~~~~~~~~~
>> -
>> -The spdx module has been integrated to a layer named meta-spdxscanner.
>> -meta-spdxscanner provides several kinds of scanner. If you want to enable
>> -this function, you have to follow the following steps:
>> -
>> -1. Add meta-spdxscanner layer into ``bblayers.conf``.
>> -
>> -2. Refer to the README in meta-spdxscanner to setup the environment (e.g,
>> -   setup a fossology server) needed for the scanner.
>> -
>> -3. Meta-spdxscanner provides several methods within the bbclass to create spdx files.
>> -   Please choose one that you want to use and enable the spdx task. You have to
>> -   add some config options in ``local.conf`` file in your :term:`Build
>> -   Directory`. Here is an example showing how to generate spdx files
>> -   during BitBake using the fossology-python.bbclass::
>> -
>> -      # Select fossology-python.bbclass.
>> -      INHERIT += "fossology-python"
>> -      # For fossology-python.bbclass, TOKEN is necessary, so, after setup a
>> -      # Fossology server, you have to create a token.
>> -      TOKEN = "eyJ0eXAiO..."
>> -      # The fossology server is necessary for fossology-python.bbclass.
>> -      FOSSOLOGY_SERVER = "http://xx.xx.xx.xx:8081/repo"
>> -      # If you want to upload the source code to a special folder:
>> -      FOLDER_NAME = "xxxx" //Optional
>> -      # If you don't want to put spdx files in tmp/deploy/spdx, you can enable:
>> -      SPDX_DEPLOY_DIR = "${DEPLOY_DIR}" //Optional
>> -
>> -For more usage information refer to :yocto_git:`the meta-spdxscanner repository
>> -</meta-spdxscanner/>`.
>> -
>>   Compliance Limitations with Executables Built from Static Libraries
>>   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>   
>> @@ -11711,6 +11676,67 @@ When analyzing CVEs, it is recommended to:
>>   -  follow public `open source security mailing lists <https://oss-security.openwall.org/wiki/mailing-lists>`__ for
>>      discussions and advance notifications of CVE bugs and software releases with fixes.
>>   
>> +Creating a Software Bill of Materials
>> +=====================================
>> +
>> +Once you are able to build an image for your project, once the licenses for
>> +each software component are all identified (see
>> +":ref:`dev-manual/common-tasks:working with licenses`") and once vulnerability
>> +fixes are applied (see ":ref:`dev-manual/common-tasks:checking
>> +for vulnerabilities`"), the OpenEmbedded build system can generate
>> +a description of all the components you used, their licenses, their dependencies,
>> +the changes that were applied and the known vulnerabilities that were fixed.
>> +
>> +This description is generated in the form of a *Software Bill of Materials*
>> +(:term:`SBOM`), using the :term:`SPDX` standard.
>> +
>> +When you release software, this is the most standard way to provide information
>> +about the Software Supply Chain of your software image and SDK, and allow your
>> +users and customers to perform vulnerability and license compliance assessments,
>> +using the tools of their choice.
> I'd mention also something like this:
>
> "The :term:`SBOM` tooling is often used to ensure open source license compliance
> by providing the license texts used in the product which legal departments and end
> users can read in standardized format."

I like this wording. See how I took it into account in my next iteration.

>
> Then I'd somehow link this to the features which create source code tar
> balls, since those are needed to fulfill "source code access" license
> requirements.


Done, in the common-tasks.rst file and in variables.rst in the
description of the SPDX_ARCHIVE_SOURCES variable.

See my V2 coming soon.
Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


