Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web08.6902.1631709372180728295
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Sep 2021 05:36:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.232, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id 4187D200004;
	Wed, 15 Sep 2021 12:36:09 +0000 (UTC)
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 3/4] ref-manual: improve documentation for RECIPE_NO_UPDATE_REASON
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
References: <20210915101219.2198566-1-michael.opdenacker@bootlin.com>
 <20210915101219.2198566-3-michael.opdenacker@bootlin.com>
 <20210915115414.foevwwwmhcivc2ra@fedora>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <622d16f8-2384-8dee-ea51-3f0ae5d30d5c@bootlin.com>
Date: Wed, 15 Sep 2021 14:36:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210915115414.foevwwwmhcivc2ra@fedora>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Quentin,

Many thanks for the reviews!

On 9/15/21 1:54 PM, Quentin Schulz wrote:
>
>>  
>> +   :term:`RECIPE_NO_UPDATE_REASON`
>> +      If a recipe should not be replaced by a more recent upstream version,
>> +      setting this variable in a recipe allows to explain the reason why in
> I think it's missing the information about what this variable should be
> set to (the reason - a string).
>
> What about:
> """
> If a recipe should not be replaced by a more recent upstream version,
> putting the reason why in this variable in a recipe allows
> ``devtool check-upgrade-status`` command to display it, as explained
> [...]
> """
>
> What do you think?


That's definitely clearer. Adopted, thanks!

>
>> +      the output of the ``devtool check-upgrade-status`` command, as explained
>> +      in the ":ref:`ref-manual/devtool-reference:checking on the upgrade Status of a recipe`"
> lowercase S in the reflink?


Oops, forgot that one, thanks!

Cheers,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

