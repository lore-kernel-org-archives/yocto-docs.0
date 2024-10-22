Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D36D0D1CDB2
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 08:29:03 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.13483.1729585734278351164
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Oct 2024 01:28:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=poZyp+BJ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CC3A7FF806;
	Tue, 22 Oct 2024 08:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729585733;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CjWUVdAaf9TV4VN9lSwTqYVSDScruagK3edBpBHnLCg=;
	b=poZyp+BJRqOq+iehxzqsfThEX6eS6xZAAYxbrkh0MZ6qSFMOPhozYsQKhsGPfaCQj7waVw
	fDCUFZK4Z52zWntI/N/1gl5M++3BgYjsumles4zD6uvuQ8GIoY9UXs0P9HzvAKVcsYiOwy
	V+UlH3wwH3jzZEWb1iODHUiYDFS9q95JTSE7w/aPtF9vry0MzGt/uDdZCJEM4BvqZp5G4r
	3ZRWr1OY84H1jvq6exwSAZICWQxQ+SBgv3IQPxqVwNn3+jFU9sznM24M2pyGvxVw29SjMD
	Mtw8ayGWEamKVjxfq19Tkvr/2enAoFbB53z1nYJATKp7L+PEQWgoLpN7NVNyqw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Oct 2024 10:28:52 +0200
Message-Id: <D526Z0H72A2Z.26NHFXEOHF1FQ@bootlin.com>
Subject: Re: [docs] [PATCH 2/2] ref-manual: devtool-reference: document
 missing commands
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2.r77.gd58065ac
References: <20241017-devtool-improvements-v1-0-2bacc656fe39@bootlin.com>
 <20241017-devtool-improvements-v1-2-2bacc656fe39@bootlin.com>
 <24e902a1-e89f-4e23-99f8-6b4792f603f3@cherry.de>
In-Reply-To: <24e902a1-e89f-4e23-99f8-6b4792f603f3@cherry.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Oct 2024 08:29:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5547

Hi Quentin,

On Fri Oct 18, 2024 at 1:35 PM CEST, Quentin Schulz wrote:
> Hi Antonin,
>
> On 10/17/24 5:13 PM, Antonin Godard via lists.yoctoproject.org wrote:
>> Give a brief description for important commands that made it into
>> devtool or that were missing from this quick reference document.
>>
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>> ---
>>   documentation/ref-manual/devtool-reference.rst | 52 ++++++++++++++++++=
++++++++
>>   1 file changed, 52 insertions(+)
>>
>> diff --git a/documentation/ref-manual/devtool-reference.rst b/documentat=
ion/ref-manual/devtool-reference.rst
>> index 9c36195c5a5a2405cf8e3a562a2a53291e97c859..e4c7f79a23644f2a89c882ce=
5e2130fb2a93a4b1 100644
>> --- a/documentation/ref-manual/devtool-reference.rst
>> +++ b/documentation/ref-manual/devtool-reference.rst
>> @@ -463,6 +463,20 @@ Here is an example that resets the workspace direct=
ory that contains the
>>      NOTE: Leaving source tree /home/scottrif/poky/build/workspace/sourc=
es/mtr as-is; if you no longer need it then please delete it manually
>>      $
>>
>> +.. _devtool-finish-working-on-a-recipe:
>> +
>> +Finish Working on a Recipe
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>> +
>> +Use the ``devtool finish`` command to push any committed changes to the
>> +specified recipe in the specified layer and remove it from your workspa=
ce.
>> +
>> +This is roughly equivalent to the ``devtool update-recipe`` command fol=
lowed by
>> +the ``devtool reset`` command. The changes must have been committed to =
the git
>> +repository created by ``devtool``. Here is an example::
>> +
>> +  $ devtool finish recipe /path/to/custom/layer
>> +
>>   .. _devtool-building-your-recipe:
>>
>>   Building Your Recipe
>> @@ -614,3 +628,41 @@ a match.
>>
>>   When you use the ``devtool search`` command, you must supply a keyword=
.
>>   The command uses the keyword when searching for a match.
>> +
>> +Alternatively, the ``devtool find-recipe`` command can be used to searc=
h for
>> +recipe files instead of recipe names. Likewise, you must supply a keywo=
rd.
>> +
>> +.. _devtool-get-the-configure-script-help:
>> +
>> +Get Information on Recipe Configuration Scripts
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +Use the ``devtool configure-help`` command to get help on the configura=
tion
>> +script options for a given recipe. You must supply the recipe name to t=
he
>
> I had to read the code and the help text of the command to understand
> what is meant by "configuration script options".
>
> I guess we could provide an example here to make this a bit clearer?
>
> What about:
> """
> E.g. for ``autotools``-based recipes, shows the output of ``./configure
> --help``.
> """
>
> or something along those lines?

+1, I'll add that to the v2.

>> +command.
>> +
>> +The ``configure-help`` command will also display the configuration opti=
ons
>> +currently in use, including the ones passed through the :term:`EXTRA_OE=
CONF`
>> +variable.
>> +
>> +.. _devtool-generate-an-ide-configuration-for-a-recipe:
>> +
>> +Generate an IDE Configuration for a Recipe
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +The ``devtool ide-sdk`` automatically creates an IDE configuration and =
SDK to
>> +work on a given recipe. Depending on the ``--mode`` parameter, differen=
t types
>> +of SDKs are generated:
>> +
>> +-  ``modified`` mode: this creates an SDK and generates an IDE configur=
ation in
>> +   the workspace directory.
>> +
>> +-  ``shared`` mode: this creates a cross-compiling toolchain and the
>> +   corresponding shared sysroot directories of the supplied recipe(s).
>> +
>> +The ``--target`` option can be used to specify a ``username@hostname`` =
string
>> +and create a remote debugging configuration for the recipe.
>> +
>
> This also means the target needs an SSH server running?
>
> I guess we could put a word on that and maybe say "similarly to
> ``devtool deploy-target`` (and we can link to it since it's a reference
> in the same file).
>
> What do you think?

Yes, indeed it does need an ssh server running on the target. I'll add that
also.

> Looks good to me otherwise, though I haven't used any of those options
> aside from finish :)

Thanks!
Antonin

--
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

