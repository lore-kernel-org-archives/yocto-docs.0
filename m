Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web08.6865.1628071486560579519
 for <docs@lists.yoctoproject.org>;
 Wed, 04 Aug 2021 03:04:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay10.mail.gandi.net (Postfix) with ESMTPSA id BEF5B240004;
	Wed,  4 Aug 2021 10:04:34 +0000 (UTC)
Subject: Re: [docs] [PATCH 1/2] test-manual: Add extra detail to YP Compatible section
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 docs@lists.yoctoproject.org
References: <20210804094714.3500323-1-richard.purdie@linuxfoundation.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <d982b722-9fd8-035f-878e-62ce7da99e9c@bootlin.com>
Date: Wed, 4 Aug 2021 12:04:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210804094714.3500323-1-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Richard,

Thanks for the documentation patch!

On 8/4/21 11:47 AM, Richard Purdie wrote:
> Add a note about documenting where a layer doesn't support 'core'
> functionality.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  documentation/test-manual/yocto-project-compatible.rst | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/documentation/test-manual/yocto-project-compatible.rst b/documentation/test-manual/yocto-project-compatible.rst
> index a7897469f..b83a0f12b 100644
> --- a/documentation/test-manual/yocto-project-compatible.rst
> +++ b/documentation/test-manual/yocto-project-compatible.rst
> @@ -115,6 +115,11 @@ Here are key best practices the program tries to encourage:
>     user changes a configuration setting to activate the layer, by selecting
>     a :term:`MACHINE`, a :term:`DISTRO` or a :term:`DISTRO_FEATURES` setting.
>  
> +-  Layers should be documenting where they don’t support normal 'core'
> +   functionality such as where debug symbols are disabled or missing, where
> +   development headers and on-target library usage may not work or where


Replaced "or" by "and" here, as we are dealing with a list of examples,
rather than with a list of alternatives.
https://forum.oxforddictionaries.com/en/discussion/27/such-as-or-or-and


> +   functionality like the SDK/eSDK would not be execpted to work.


s/execpted/expected/

This sounded like a system call, too much work with glibc, I guess ;-)
I took care of this change too, and will merge the change into
master-next (though extra reviews are still possible).

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

