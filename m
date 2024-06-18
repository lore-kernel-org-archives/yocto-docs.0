Return-Path: <michael@opdenacker.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33087C27C4F
	for <webhook@archiver.kernel.org>; Tue, 18 Jun 2024 14:52:54 +0000 (UTC)
Received: from sender21-op-o13.zoho.eu (sender21-op-o13.zoho.eu [185.172.199.227])
 by mx.groups.io with SMTP id smtpd.web11.88409.1718722372413089131
 for <docs@lists.yoctoproject.org>;
 Tue, 18 Jun 2024 07:52:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=michael@opdenacker.org header.s=zmail header.b=EWcz05nK;
 spf=pass (domain: opdenacker.org, ip: 185.172.199.227, mailfrom: michael@opdenacker.org)
ARC-Seal: i=1; a=rsa-sha256; t=1718722368; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=FPXp2ODyeMfjxeVRBd2ysWLuPAo9l0etidlrfEWddkPmwh4LNHrlhZ1K4NUIr3JGgPLq9Ul/1Kkl0jDa4zBUSDZ1YAeu8Xe1Jxw+zhGeTHNiEznoOkOEHMfdsnQkIdn7k+FiEw3JDbiWC2mgm9R7Dl5htifyEJnfwKsuPHXrVGA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1718722368; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ekKLbS8yJ9nF+LtMWWTg4VXpJPjkzJmPGc347kBvRQ0=; 
	b=eSxplC1r43GcnWkambXq5zLWVhHv5XdXTBE1MAO6XJhO+FMru5i/TlYgwVS2bkRw0vuYh1vO6B9DAQTQpMdwcVY2G1KCKp2yPKqOIgAjqep6U0TltFesWoCFFtmGO85KbDNRnsPzO+j9VMl0lxI0yWFNhuTC4p3qLJSCvPkfiL8=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=opdenacker.org;
	spf=pass  smtp.mailfrom=michael@opdenacker.org;
	dmarc=pass header.from=<michael@opdenacker.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1718722368;
	s=zmail; d=opdenacker.org; i=michael@opdenacker.org;
	h=Message-ID:Date:Date:MIME-Version:Cc:Cc:Subject:Subject:To:To:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=ekKLbS8yJ9nF+LtMWWTg4VXpJPjkzJmPGc347kBvRQ0=;
	b=EWcz05nKsHdqNOli2kMyZjvLWlcQ3D7actSNjUXqNEnEJAsVqSj1ShxlanLRYzwQ
	zo0fEXF/P6LsZOGadSDpG62HkNy5/QO1bC4Lr3ktdAgPTAOUMqRpBsDO7cw7Kmjn3U0
	lQTsVKQIu4tKwuICUHOJe/CzB/aORPkW2f5ErkAM=
Received: by mx.zoho.eu with SMTPS id 1718722366249803.1940734985671;
	Tue, 18 Jun 2024 16:52:46 +0200 (CEST)
Message-ID: <fff06fc0-4768-4fbd-a65d-77ba1dc7527a@opdenacker.org>
Date: Tue, 18 Jun 2024 16:52:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] documentation/README: refer to doc package
 requirements
To: quentin.schulz@cherry.de
References: <20240611125026.22702-1-michael@opdenacker.org>
 <6495eea0-e391-43a9-a55f-22cf78fc96a8@cherry.de>
Content-Language: en-US
From: Michael Opdenacker <michael@opdenacker.org>
In-Reply-To: <6495eea0-e391-43a9-a55f-22cf78fc96a8@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 18 Jun 2024 14:52:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5297

Hi Quentin,

Thanks for the review!

On 6/13/24 10:37, Quentin Schulz via lists.yoctoproject.org wrote:
> Hi Michael,
>
> On 6/11/24 2:50 PM, Michael Opdenacker via lists.yoctoproject.org wrote:
>> From: Michael Opdenacker <michael@opdenacker.org>
>>
>> Refer to package requirements for building documentation
>> from supported distributions. The simple instructions
>> previously listed no longer work on Ubuntu 24.04, for example.
>>
>> Signed-off-by: Michael Opdenacker <michael@opdenacker.org>
>> ---
>>   documentation/README | 29 +++--------------------------
>>   1 file changed, 3 insertions(+), 26 deletions(-)
>>
>> diff --git a/documentation/README b/documentation/README
>> index b60472fcbf..c888b666a8 100644
>> --- a/documentation/README
>> +++ b/documentation/README
>> @@ -108,32 +108,9 @@ generated with DocBook.
>>   How to build the Yocto Project documentation
>>   ============================================
>>   -Sphinx is written in Python. While it might work with Python2, for
>> -obvious reasons, we will only support building the Yocto Project
>> -documentation with Python3.
>> -
>> -Sphinx might be available in your Linux distro packages repositories,
>> -however it is not recommended to use distro packages, as they might be
>> -old versions, especially if you are using an LTS version of your
>> -distro. The recommended method to install the latest versions of Sphinx
>> -and of its required dependencies is to use the Python Package Index 
>> (pip).
>> -
>> -To install all required packages run:
>> -
>> - $ pip3 install sphinx sphinx_rtd_theme pyyaml
>> -
>> -To make sure you always have the latest versions of such packages, you
>> -should regularly run the same command with an added "--upgrade" option:
>> -
>> - $ pip3 install --upgrade sphinx sphinx_rtd_theme pyyaml
>> -
>> -Also install the "inkscape" package from your distribution.
>> -Inkscape is need to convert SVG graphics to PNG (for EPUB
>> -export) and to PDF (for PDF export).
>> -
>> -Additionally install "fncychap.sty" TeX font if you want to build 
>> PDFs. Debian
>> -and Ubuntu have it in "texlive-latex-extra" package while RedHat 
>> distributions
>> -and OpenSUSE have it in "texlive-fncychap" package for example.
>> +To build the documentation, you need Sphinx and a few other packages,
>> +which depend on your host GNU/Linux distribution. Such packages are 
>> listed on
>> +https://docs.yoctoproject.org/dev/ref-manual/system-requirements.html#required-packages-for-the-build-host 
>>
>
> This points to the latest commit in the master branch and not 
> necessarily the one which contains the appropriate instructions for 
> the version of the yocto-docs one currently has checked out. We could 
> point at documentation/ref-manual/system-requirements.rst and 
> PIP3_HOST_PACKAGES in documentation/poky.yaml.in though but not sure 
> it makes it easier to know what to do. A bit of a chicken and the egg 
> problem as to get a simple up-to-date instruction on how to build the 
> docs, you need the docs built.


You have a point. Maybe just pointing to the production version of the 
docs 
(https://docs.yoctoproject.org/ref-manual/system-requirements.html#required-packages-for-the-build-host) 
would be a acceptable compromise. This way, people don't have to build 
the docs to know how to build them, and then can then use the version 
switcher menu to find the docs that match their particular version.

What do you think?
Cheers
Michael.


