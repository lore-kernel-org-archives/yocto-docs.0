Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web08.1988.1631802523827018277
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Sep 2021 07:28:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.232, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id D1A2820000D;
	Thu, 16 Sep 2021 14:28:41 +0000 (UTC)
Subject: Re: [docs] [PATCH v3 3/5] ref-manual: improve "devtool check-upgrade-status" details
To: Quentin Schulz <foss@0leil.net>, docs@lists.yoctoproject.org
References: <16A4FF8E231E8D2E.4682@lists.yoctoproject.org>
 <20210915175842.2998541-1-michael.opdenacker@bootlin.com>
 <20210915175842.2998541-4-michael.opdenacker@bootlin.com>
 <3EAD4F8F-CC3D-4DC2-A92F-EDEF58BBC535@0leil.net>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <185661d2-b932-685f-b506-3e7fcd42c120@bootlin.com>
Date: Thu, 16 Sep 2021 16:28:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <3EAD4F8F-CC3D-4DC2-A92F-EDEF58BBC535@0leil.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Quentin,

On 9/16/21 9:31 AM, Quentin Schulz wrote:
>> +To check on the upgrade status of a recipe, you can use the
>> +``devtool latest-version recipe`` command, which quickly shows the current
>> +version and the latest version available upstream. To get such information
>> +for all available recipes, use the ``devtool check-upgrade-status`` command.
>> +The command displays a table of your current recipe versions, the latest
>> +upstream versions, the email address of the recipe's maintainer, and any
>> +additional information such as commit hash strings and reasons you might
>> +not be able to upgrade a particular recipe.
>> +
> I am always lost with singular/plural for one thing that applies to each and every one of a number of items. I am not sure "recipe versions" is correct here. I was thinking "recipes version" would match better (one version per recipe and there are many recipes) but cannot decide 🙃
>
> """
> Each recipe will have its current version and latest upstream version, as well as the email of the maintainer and any additional information such as the commit hash or reason for not being able to upgrade it, displayed in a table.
> """
>
> is what I could come up with. Hopefully it's a bit clearer to not only me :)


I wasn't the one writing this, but I agree the expression is ambiguous.
I adopted your suggestion, which I agree is clearer. Thanks!

>
>
> +Last but not least, you may set :term:`UPSTREAM_VERSION_UNKNOWN` to ``1``
> +in a recipe when no way is found to determine its latest upstream version.
> +
> """
> when there's currently no way to determine...


Ah, right, that's better, thanks!

> - you can set :term:`UPSTREAM_VERSION_UNKNOWN`` to ``1`` in the recipe
>> +      you can set :term:`UPSTREAM_VERSION_UNKNOWN` to ``1`` in the recipe
> This one typo fix should be in the commit that introduces it :)


Yes, right. I noticed too late and this is embarrassing. My bad!

Thanks again,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

