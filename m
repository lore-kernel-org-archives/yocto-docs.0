Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web08.6982.1631709760206179474
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Sep 2021 05:42:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 65AB720018;
	Wed, 15 Sep 2021 12:42:38 +0000 (UTC)
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 2/4] ref-manual: improve "devtool check-upgrade-status" details
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
References: <20210915101219.2198566-1-michael.opdenacker@bootlin.com>
 <20210915101219.2198566-2-michael.opdenacker@bootlin.com>
 <20210915114433.xdynepq2bzxydfwd@fedora>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <55189a74-279b-46e0-7c5c-657e7d3fb39d@bootlin.com>
Date: Wed, 15 Sep 2021 14:42:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210915114433.xdynepq2bzxydfwd@fedora>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hello Quentin,

Thanks again for the reviews.

On 9/15/21 1:44 PM, Quentin Schulz wrote:
>
>> +To check on the upgrade status of a recipe, you can use the
>> +``devtool latest-version recipe`` command, which quickly shows the current
>> +version and the latest version available upstream. To get such information
>> +for all available recipes,  use the ``devtool check-upgrade-status`` command.
> Spurious space before `use` here.

Good catch, fixed, thanks.

>
>> +The command displays a table of your current recipe versions, the latest
>> +upstream versions, the email address of the recipe's maintainer, and any
>> +additional information such as commit hash strings and reasons you might
>> +not be able to upgrade a particular recipe.
>> +
>> +This upgrade checking mechanism relies on the :term:`UPSTREAM_CHECK_URI`,
>> +:term:`UPSTREAM_CHECK_REGEX` and :term:`UPSTREAM_CHECK_GITTAGREGEX` variables
>> +which can be defined in each recipe.
>>  
> I think the "can be defined in each recipe" might generate confusion and
> tell people it can be defined elsewhere.
>
> What about:
>
> """
> This upgrade checking mechanism relies on the optional[...] variables
> which are defined in package recipes.
> """
>
> What do you think?

Great. I wasn't really happy with the way I wrote it, and this is just
right! Adopted.
Many thanks,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

