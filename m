Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E274C433FE
	for <webhook@archiver.kernel.org>; Wed,  5 Oct 2022 17:47:27 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.1133.1664992045752425779
 for <docs@lists.yoctoproject.org>;
 Wed, 05 Oct 2022 10:47:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Cm4Sb0Yv;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 9A5FAC0002;
	Wed,  5 Oct 2022 17:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1664992044;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tr8NLtaxYOJLjrMlZJTOs1p//bsDaATqvgcqT6g9N2s=;
	b=Cm4Sb0YvvNHYk3EWX+gSsAD2kvTb+RH7azdRLV92HftzFJaiS4KYXALZVOQl2jyRtvMb+P
	UVRQReNOp8Yp0i3J8Q1BwD3KO0zQGJxrN/D4rpVhPtJfaXwAeQTpkiRRldWMAVLSk12CUh
	y3UClbdmUjDb3roYTd5dy/LsIVQEfjnDpti5BnFdaj8j4Q7tazXbabIXDhTdsTPk3y5ZEi
	RSe31TgjkGVtkOQpVuHsakxykP4R6hB2FL+vcUCCU9XqDHE3A9EzUgWFmpfaEFtALfGGV1
	tmHbqAKr0cwc+82zDC9OdSlXTBJT9N9Ar/XdzIDGQ3ylbqa5MzVZuHN72DrEDg==
Message-ID: <ed73ede3-0727-f5c7-cd1e-e10eef94b1a5@bootlin.com>
Date: Wed, 5 Oct 2022 19:47:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Cc: docs@lists.yoctoproject.org, yocto@lists.yoctoproject.org
Subject: Re: [docs] Setting up layers in Yocto, the introduction
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <20220926161657.7675-1-alex.kanavin@gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20220926161657.7675-1-alex.kanavin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 05 Oct 2022 17:47:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3286

Hi Alex

On 26.09.22 18:16, Alexander Kanavin wrote:
> TL;DR version
> =============
>
> If you want to get everything needed to run a yocto build:
>
> - clone the bootstrap repository (ask your distribution maintainer where it is):
>      $ git clone bootstrap_repo_uri
>
> - run 'setup-layers' from that repo:
>      $ /path/to/bootstrap_repo/setup-layers
>
> If you want to save the layers setup for replication elsewhere:
>
> - save the config file and the replication script into a 'bootstrap repository')
> (this can be an organization-specific yocto layer, or a standalone repository):
>      $ bitbake-layers create-layers-setup /path/to/bootstrap_repo
>
> - document where the bootstrap repository can be found for your users
>
> What is this layer setup tooling? (the long version)
> ====================================================
>
> Once you have a working build with the correct set of layers, it is beneficial
> to capture the layer setup --- what they are, which repositories they come from
> and which SCM revisions they're at --- into a configuration file, so that this
> setup can be easily replicated later, perhaps on a different machine. Here's
> how to do this::
>
>     $ bitbake-layers create-layers-setup /srv/work/alex/meta-alex/
>     NOTE: Starting bitbake server...
>     NOTE: Created /srv/work/alex/meta-alex/setup-layers.json
>     NOTE: Created /srv/work/alex/meta-alex/setup-layers
>
> The tool needs a single argument which tells where to place the output, consisting
> of a json formatted layer configuration, and a ``setup-layers`` script that can use that configuration
> to restore the layers in a different location, or on a different host machine. The argument
> can point to a custom layer (which is then deemed a "bootstrap" layer that needs to be
> checked out first), or into a completely independent location.
>
> The replication of the layers is performed by running the ``setup-layers`` script provided
> above:
>
> 1. Clone the bootstrap layer or some other repository to obtain
>     the json config and the setup script that can use it.
>
> 2. Run the script directly with no options::
>
>        alex@Zen2:/srv/work/alex/my-build$ meta-alex/setup-layers
>        Note: not checking out source meta-alex, use --force-bootstraplayer-checkout to override.
>
>        Setting up source meta-intel, revision 15.0-hardknott-3.3-310-g0a96edae, branch master
>        Running 'git init -q /srv/work/alex/my-build/meta-intel'
>        Running 'git remote remove origin > /dev/null 2>&1; git remote add origin git://git.yoctoproject.org/meta-intel' in /srv/work/alex/my-build/meta-intel
>        Running 'git fetch -q origin || true' in /srv/work/alex/my-build/meta-intel
>        Running 'git checkout -q 0a96edae609a3f48befac36af82cf1eed6786b4a' in /srv/work/alex/my-build/meta-intel
>
>        Setting up source poky, revision 4.1_M1-372-g55483d28f2, branch akanavin/setup-layers
>        Running 'git init -q /srv/work/alex/my-build/poky'
>        Running 'git remote remove origin > /dev/null 2>&1; git remote add origin git://git.yoctoproject.org/poky' in /srv/work/alex/my-build/poky
>        Running 'git fetch -q origin || true' in /srv/work/alex/my-build/poky
>        Running 'git remote remove poky-contrib > /dev/null 2>&1; git remote add poky-contrib ssh://git@push.yoctoproject.org/poky-contrib' in /srv/work/alex/my-build/poky
>        Running 'git fetch -q poky-contrib || true' in /srv/work/alex/my-build/poky
>        Running 'git checkout -q 11db0390b02acac1324e0f827beb0e2e3d0d1d63' in /srv/work/alex/my-build/poky
>
> .. note::
>
>     This will work to update an existing checkout as well.
>
> .. note::
>     The script is self-sufficient and requires only python3
>     and git on the build machine.
>
> .. note::
>     Both the ``create-layers-setup`` and the ``setup-layers`` provided several additional options
>     that customize their behavior - you are welcome to study them via ``--help`` command line parameter.
>
> Questions and answers
> =====================
>
> 1. Why JSON, and not YAML?
>
> JSON is a part of the python standard library, while YAML is not. This means you can bootstrap a build on just about any
> machine that has python and its core library, without first having to install any dependencies. JSON not quite as easy
> on the eye, but with decent indentation it's totally ok.
>
> Before anyone asks, XML is appallingly difficult to read by modern standards of readability. No thanks.
>
> 2. I don't want the script in the bootstrap repo, just the config. I will provide my own tools. How?
>
> Use --json-only to generate only the config, and not the script:
>
>      $ bitbake-layers create-layers-setup -json-only /srv/work/alex/meta-alex/
>
> 3. I want to generate the compatible json with my own tools. Is there a schema to validate it?
>
> There is:
> https://git.yoctoproject.org/poky/tree/meta/files/layers.schema.json
>
> You can use python3-jsonschema package to check the validity.
>
> 4. I don't want the json or the script, and would want to use an entirely different format and tools. Is
> 'create-layers-setup' hardcoded to the OE json format?
>
> Actually not! Other formats can be added through a plugin mechanism. OE json writer is just
> the default plugin but others can be implemented and selected:
>
>      --writer {oe-setup-layers}, -w {oe-setup-layers}
>                          Choose the output format (defaults to oe-setup-layers).
>
> 5. I want to use something else than hardcoded revisions in the json (e.g. refer to branch
> names or tags).
>
> No problem! Edit the json to say 'main' or 'release-x.y'. Anything that 'git checkout' can take will
> work. Just be careful that these modification are not overwritten later by 'create-layers-setup' by
> e.g. renaming the json file first.
>
> 6. I already have an existing checkout and want to update it to the latest greatest. How?
>
> First, update the bootstrap repository to the latest (or otherwise desired) revision to
> obtain the latest versions of the script, and the json config. Ask the distro maintainers
> for the recommended practice to do so.
>
> Then, run the script again - it should be able to handle a layers checkout that already
> exists, and update everything accoriding to the latest json, obtained in the first step.
>
> 7. Ok, I have checked out all the layers. Now what?
>
> The next step is to actually set up a yocto build from an existing configuration template,
> and start a bitbake session. This is made separate from handling the layer repositories and
> will be described separately.


Thank you for the proposed documentation.
Do you want me to look for an appropriate place in the documentation 
sources where it could be included, and then propose a patch?

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


