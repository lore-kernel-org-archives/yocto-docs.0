Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web12.9167.1619453483942861907
 for <docs@lists.yoctoproject.org>;
 Mon, 26 Apr 2021 09:11:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
X-Originating-IP: 92.150.42.106
Received: from [10.0.0.12] (lfbn-mar-1-834-106.w92-150.abo.wanadoo.fr [92.150.42.106])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id C8ABEE0007;
	Mon, 26 Apr 2021 16:11:11 +0000 (UTC)
Cc: openembedded-core@lists.openembedded.org, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] dev-manual/common-tasks.rst: correct the documentation for debuginfod
To: Quentin Schulz <quentin.schulz@streamunlimited.com>,
 Alexander Kanavin <alex.kanavin@gmail.com>
References: <20210426104210.789444-1-alex.kanavin@gmail.com>
 <20210426104657.yeyfms3riieplyia@qschulz>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <d186182b-637f-fdf0-4188-45ca776333c7@bootlin.com>
Date: Mon, 26 Apr 2021 18:11:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210426104657.yeyfms3riieplyia@qschulz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Alex,

On 4/26/21 12:46 PM, Quentin Schulz wrote:
> Hi Alex,
>
> Could you please add the v2/v3/vwhatever in the mail subject next time?
> You can do so by passing `-v 2` to `git format-patch`. This helps us
> keep track of which version of a patch should be merged (well, it helps
> Michael :p) and on which patch series to answer/rewview.
>
> No need to do it this time :)


I agree :)

Thanks for the patch.

Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

Merged into the "master-next" branch of the yocto-docs repository
(http://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/log/?h=master-next).
I should send a new pull-request for inclusion in "master" by the end of
the week.

Thanks again,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

