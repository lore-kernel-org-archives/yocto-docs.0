Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6C1BD29FBB
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 15:28:47 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.48302.1730906926894472933
 for <docs@lists.yoctoproject.org>;
 Wed, 06 Nov 2024 07:28:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=VeQFGpnn;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 73A51E0004;
	Wed,  6 Nov 2024 15:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730906924;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XWWW0AkvQ19Vx0sXtVZA9EKic2nDOeaOi8BUsRoOifE=;
	b=VeQFGpnn02g1zQWAFlduExUEU99tDm8aza7MiRYlxtvQ3btLah9QzwjdhS3mb9g8YGtSlr
	qjA55LNP+pcE9gBsn0b1fO0zyXt077ArymQkQM+a3iJoTGvTonQ4HPZmI4JtlnaTOeRfce
	qawBvDC9T5KW4KDz6Eca9VxwNKtdtve48ekRu59SL5QkPg1UfW+OMhC00fy77u3KDjtUsT
	xRel3nlTfILwClGgvXaLZLeZ/iuR8ZPkyEKgw4PJ/pQrRJdrE3kFNIxSLwW8Vl03OB29WS
	hwi6RX1X1zzqDti9W0sPsrwUqQ3pN7r0i3QwUpu7SA7toA+XtDa+5zSOPaax1w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 06 Nov 2024 16:28:43 +0100
Message-Id: <D5F7ANGQW3NN.1G5TIUZ5AYR1H@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Julien Stephan" <jstephan@baylibre.com>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH v5 0/3] Add bblock documentation
X-Mailer: aerc 0.18.2.r87.gd0484b15
References: <20241106-add-bblock-documentation-v5-0-625806c6a3ce@baylibre.com>
In-Reply-To: <20241106-add-bblock-documentation-v5-0-625806c6a3ce@baylibre.com>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 06 Nov 2024 15:28:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5704

Hi Julien,

On Wed Nov 6, 2024 at 2:54 PM CET, Julien Stephan wrote:
> Hello,
>
> The main purpose of this series is to add documentation for bblock.
>
> bblock uses internally the 3 following variables: SIGGEN_LOCKEDSIGS,
> SIGGEN_LOCKEDSIGS_TASKSIG_CHECK and SIGGEN_LOCKEDSIGS_TYPE which are not
> documentated, so adding them to the glossary.
>
> I also added "sstate" into the Yocto vocabulary to avoir error when runni=
ng
> Vale.
>
> This series was built and checked with:
>
>   $ make html
>   $ make stylecheck VALEDOCS=3Ddev-manual/bblock.rst
>   $ make sphinx-lint SPHINXLINTDOCS=3Ddev-manual/bblock.rst
>
> I tried my best to make Vale happy, but I still have the following
> warnings:
>
>  dev-manual/bblock.rst
>  1:1  warning     Try to keep the Coleman=E2=80=93Liau Index grade (10.29=
) below 9.                           Readability.ColemanLiau
>  1:1  warning     Try to keep the Flesch reading ease score (57.51) above=
 70.                         Readability.FleschReadingEase
>  1:1  warning     Try to keep the Flesch=E2=80=93Kincaid grade level (8.2=
8) below 8.                          Readability.FleschKincaid
>  1:1  warning     Try to keep the SMOG grade (11.42) below 10.           =
                             Readability.SMOG
>  1:1  warning     Try to keep the LIX score (38.20) below 35.            =
                             Readability.LIX
>  3:1  suggestion  Use sentence-style capitalization in 'Locking and Unloc=
king Recipes Using ******'.  RedHat.Headings
>  29:49  suggestion  Consider wrapping this Pascal or Camel case term ('Ti=
psAndTricks') in backticks.    RedHat.PascalCamelCase
>  39:60  suggestion  Use simple language. Consider using 'many' rather tha=
n 'multiple'.                  RedHat.SimpleWords
>  39:60  warning     'multiple' is too wordy.                             =
                               write-good.TooWordy
>  57:62  warning     'multiple' is too wordy.                             =
                               write-good.TooWordy
>  76:43  error       Use 'BitBake' instead of 'bitbake'.                  =
                               Vale.Terms
>  76:58  error       Use 'OpenEmbedded' instead of 'openembedded'.        =
                               Vale.Terms
>  76:71  warning     Use either 'or' or 'and' in 'core/tree'              =
                               RedHat.Slash
>  76:81  warning     Use either 'or' or 'and' in 'meta/conf'              =
                               RedHat.Slash
>  76:91  error       Use 'BitBake' instead of 'bitbake'.                  =
                               Vale.Terms
>
> About the Readability, I am not sure I can do better ^^ But anyone with
> better english skills than me can help here!
>
> About the capitalization: I decided to ignore it to keep consistency with
> all other headings of the reference manual.
>
> Suggestion and errors/warnings on lines 29 and 76 are false positive, we =
may need
> to add some rule to ignore these check on :oe_git: directives
> Also ignore the warning about 'multiple' as 'many' does not fit well in
> this case.
>
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> ---
> Changes in v5:
> - add missing "tmp" in stamps file path in SIGGEN_LOCKEDSIGS
>   documentation
> - reword a sentence in SIGGEN_LOCKEDSIGS  documentation
> - Link to v4: https://lore.kernel.org/r/20241106-add-bblock-documentation=
-v4-0-9f24dfe69243@baylibre.com
>
> Changes in v4:
> - use "the sstate cache" everywhere for consistency
> - fix some typo
> - add comment to explain that bblock.conf does not exist by default
> - Link to v3: https://lore.kernel.org/r/20241105-add-bblock-documentation=
-v3-0-b870ded39a2d@baylibre.com
>
> Changes in v3:
> - Fix missing typos reported by Ulrich Olmann in v1
> - Link to v2: https://lore.kernel.org/r/20241104-add-bblock-documentation=
-v2-0-0704e4d59929@baylibre.com
>
> Changes in v2:
> - Fixed various typos reported by Ulrich =C3=96lmann and Antonin Godard
> - Splited the series in two: the Readme/Makefile changes related to Vale
>   and SPHINXLINT and bblock documentation
> - Added a bblock.conf file in `documentation/ref-manual/structure.rst`
> - Link to v1: https://lore.kernel.org/r/20241031-add-bblock-documentation=
-v1-0-32b89093bbda@baylibre.com
>
> ---
> Julien Stephan (3):
>       styles: vocabularies: Yocto: add sstate
>       ref-manual: variables: add SIGGEN_LOCKEDSIGS* variables
>       dev-manual: add bblock documentation
>
>  documentation/dev-manual/bblock.rst                | 129 +++++++++++++++=
++++++
>  documentation/dev-manual/index.rst                 |   1 +
>  documentation/ref-manual/structure.rst             |   9 ++
>  documentation/ref-manual/variables.rst             |  47 ++++++++
>  .../styles/config/vocabularies/Yocto/accept.txt    |   1 +
>  5 files changed, 187 insertions(+)
> ---
> base-commit: 7b40c7b73a360a1ec383c4c9f00c3e126208320b
> change-id: 20241031-add-bblock-documentation-4a5f8cf9c6d2
>
> Best regards,

This looks good to me, for the series:

Reviewed-by: Antonin Godard <antonin.godard@bootlin.com>

Thanks a lot!
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


