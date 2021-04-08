Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.5587.1617873428593186136
 for <docs@lists.yoctoproject.org>;
 Thu, 08 Apr 2021 02:17:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
X-Originating-IP: 92.150.42.106
Received: from [10.0.0.12] (lfbn-mar-1-834-106.w92-150.abo.wanadoo.fr [92.150.42.106])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id BD0C81BF209;
	Thu,  8 Apr 2021 09:17:06 +0000 (UTC)
Subject: Re: [docs] [PATCH] docs: replace anchor links
To: Quentin Schulz <foss@0leil.net>, docs@lists.yoctoproject.org
References: <20210407160724.21593-1-foss@0leil.net>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <0af7032c-ddf8-91ef-e8f6-06c0bde8b0ee@bootlin.com>
Date: Thu, 8 Apr 2021 11:17:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210407160724.21593-1-foss@0leil.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Quentin

On 4/7/21 6:07 PM, Quentin Schulz wrote:
> Anchor links are treated by Sphinx as external links and are not checked
> during build, meaning it is impossible to know if a link becomes broken or
> not.
>
> As a matter of fact, most of the anchor links replaced in this commit
> were actually broken.
>
> The README now states that anchor links are forbidden so that there's no
> need to go through such a change later on.
>
> Signed-off-by: Quentin Schulz <foss@0leil.net>
> ---
>  documentation/README                          |   3 +
>  documentation/dev-manual/common-tasks.rst     | 241 ++++++++----------
>  documentation/dev-manual/qemu.rst             |   6 +-
>  documentation/dev-manual/start.rst            |  13 +-
>  documentation/kernel-dev/advanced.rst         |  42 +--
>  documentation/kernel-dev/common.rst           |  44 ++--
>  documentation/kernel-dev/intro.rst            |   3 +-
>  documentation/overview-manual/concepts.rst    |  93 +++----
>  .../development-environment.rst               |  15 +-
>  documentation/overview-manual/intro.rst       |  13 +-
>  documentation/overview-manual/yp-intro.rst    |  45 ++--
>  .../ref-manual/devtool-reference.rst          |   4 +-
>  documentation/ref-manual/migration-1.5.rst    |   2 +-
>  documentation/ref-manual/migration-2.1.rst    |   5 +-
>  documentation/ref-manual/migration-2.2.rst    |   8 +-
>  documentation/ref-manual/migration-2.6.rst    |   2 +-
>  documentation/ref-manual/release-process.rst  |   5 +-
>  .../sdk-manual/appendix-customizing.rst       |  25 +-
>  documentation/sdk-manual/appendix-obtain.rst  |  16 +-
>  documentation/sdk-manual/extensible.rst       |  11 +-
>  documentation/sdk-manual/intro.rst            |   4 +-
>  documentation/sdk-manual/using.rst            |  22 +-
>  documentation/test-manual/test-process.rst    |   2 +-
>  23 files changed, 301 insertions(+), 323 deletions(-)

Wow, thanks a ton for this very useful patch!

... and big amount of work! It took time to review the changes too. That
allowed me to learn about capitalization in reference text.

Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

I pushed it on "master-branch". I'll leave a little extra time for extra
reviews, but then I will quickly send a new PR to Richard, so that this
is in master and the next patches that we contribute don't interfere
with this one.

Thanks again!

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

