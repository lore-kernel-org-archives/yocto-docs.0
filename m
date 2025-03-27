Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA235C3600B
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 15:36:20 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.52866.1743089774451983224
 for <docs@lists.yoctoproject.org>;
 Thu, 27 Mar 2025 08:36:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 52RFZA9f002731;
	Thu, 27 Mar 2025 10:35:10 -0500
Received: from [192.168.2.109] ([192.168.2.109])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 52RFZ8DX025409;
	Thu, 27 Mar 2025 10:35:09 -0500
Message-ID: <670f3cce-9919-4418-a2c6-e96bc3fbe58f@kernel.crashing.org>
Date: Thu, 27 Mar 2025 10:35:08 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v3 1/6] documentation/conf.py: define a manpage url
Content-Language: en-US
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250327-cc-vars-v3-0-742dbddce008@bootlin.com>
 <20250327-cc-vars-v3-1-742dbddce008@bootlin.com>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <20250327-cc-vars-v3-1-742dbddce008@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 27 Mar 2025 15:36:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6654

I'm going to be a bit pedantic below, I'm not sure it matters at this point but 
I want to clarify one thing.

On 3/27/25 4:07 AM, Antonin Godard via lists.yoctoproject.org wrote:
> By defining the manpages_url we can use the :manpage: role in the
> documentation for providing links to manpages. See:
> https://www.sphinx-doc.org/en/master/usage/configuration.html#confval-manpages_url
> 
> Replace existing manpages links to use this role.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/conf.py                      | 3 +++
>   documentation/overview-manual/concepts.rst | 2 +-
>   documentation/overview-manual/yp-intro.rst | 2 +-
>   documentation/ref-manual/variables.rst     | 4 ++--
>   4 files changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/documentation/conf.py b/documentation/conf.py
> index 477e75112a..0352bbef20 100644
> --- a/documentation/conf.py
> +++ b/documentation/conf.py
> @@ -111,6 +111,9 @@ extlinks = {
>       'wikipedia': ('https://en.wikipedia.org/wiki/%s', None),
>   }
>   
> +# To able to use :manpage:`<something>` in the docs.
> +manpages_url = 'https://manpages.debian.org/{path}'
> +
>   # Intersphinx config to use cross reference with BitBake user manual
>   intersphinx_mapping = {
>       'bitbake': ('https://docs.yoctoproject.org/bitbake/' + bitbake_version, None)
> diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
> index e4d806f98f..416c28f0d9 100644
> --- a/documentation/overview-manual/concepts.rst
> +++ b/documentation/overview-manual/concepts.rst
> @@ -2204,7 +2204,7 @@ require root privileges, the fact that some earlier steps ran in a fake
>   root environment does not cause problems.
>   
>   The capability to run tasks in a fake root environment is known as
> -"`fakeroot <http://man.he.net/man1/fakeroot>`__", which is derived from
> +":manpage:`fakeroot <fakeroot(1)>`", which is derived from
>   the BitBake keyword/variable flag that requests a fake root environment
>   for a task.
>   
> diff --git a/documentation/overview-manual/yp-intro.rst b/documentation/overview-manual/yp-intro.rst
> index 4a27e12e01..11e6d99e32 100644
> --- a/documentation/overview-manual/yp-intro.rst
> +++ b/documentation/overview-manual/yp-intro.rst
> @@ -400,7 +400,7 @@ Yocto Project:
>      Autobuilder :doc:`here </test-manual/understand-autobuilder>`.
>   
>   -  *Pseudo:* Pseudo is the Yocto Project implementation of
> -   `fakeroot <http://man.he.net/man1/fakeroot>`__, which is used to run
> +   :manpage:`fakeroot <fakeroot(1)>`, which is used to run
>      commands in an environment that seemingly has root privileges.


psuedo is an implementation of three separate items:

fakeroot
fakechroot
fakepasswd (which was never a debian tool or widely used - it emulates 
/etc/passwd and /etc/group that do not match the running system)

--Mark

>      During a build, it can be necessary to perform operations that
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 41bda5d0d6..4e675b6bfb 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -4514,8 +4514,8 @@ system and gives an overview of their function and contents.
>   
>         The value in :term:`INITSCRIPT_PARAMS` is passed through to the
>         ``update-rc.d`` command. For more information on valid parameters,
> -      please see the ``update-rc.d`` manual page at
> -      https://manpages.debian.org/buster/init-system-helpers/update-rc.d.8.en.html
> +      please see the ``update-rc.d`` manual page at :manpage:`update-rc.d
> +      <update-rc.d(8)>`.
>   
>      :term:`INSANE_SKIP`
>         Specifies the QA checks to skip for a specific package within a
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#6647): https://lists.yoctoproject.org/g/docs/message/6647
> Mute This Topic: https://lists.yoctoproject.org/mt/111933087/3616948
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [mark.hatle@kernel.crashing.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

