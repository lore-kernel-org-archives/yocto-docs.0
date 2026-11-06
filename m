Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3303.1793961726803819948
 for <docs@lists.yoctoproject.org>;
 Fri, 06 Nov 2026 02:42:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=ppOLvvfQ;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=At6KyaJx;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.153, mailfrom: paul@pbarker.dev)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 1E1457A015B
	for <docs@lists.yoctoproject.org>; Fri,  6 Nov 2026 05:42:06 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Fri, 06 Nov 2026 05:42:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1793961725;
	 x=1794048125; bh=0eKmTiQem77+H974vaYfjdTf1LfALR/UApYVB3dKy4Q=; b=
	ppOLvvfQkMRCwcH8TUUr8ZQcHyDI1Tv9ZJbC366c/c8e8pqcJ/L6K5ho14QXvcSh
	ll8PUahNpDNzc2rJB+QiuzE+5uOV2tzWOG8wud9wgtNWuJKG9oT4HHr4VQzfoLbq
	opcov9sBJKTRADo/7GLOUy+krwB5aF6JIPoFMjp4AZO1Ni7lvS9sQkqnTRuSDzOE
	xDlAqIiMsJb2W54qVPMCiKV3MHSSAS8vPvFJeJe4FxJAF32Z9OUlsh9RUhsr9ZP/
	s3w27NfYzUcUQgWgoazeal8Ig/5N3kGO9WXXanLjVA4rgBERq14Lg3CO0gsD3n54
	uu99+AiXRUp59jznPrrmlg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1793961725; x=
	1794048125; bh=0eKmTiQem77+H974vaYfjdTf1LfALR/UApYVB3dKy4Q=; b=A
	t6KyaJxG9heRQrC0jC3nXaz78/b3dZNDBkWhs7MZrvDmWLVSP9iGJ5gmOEA7sUeE
	1rY/vZ6gIYjdo3L+E/IntEwImKx5EYUn25txMX8L2j33DqKfGcrkWymbVKqEwvK6
	MzP1OvBxAZ0ITvOJgupMrBNHHQv6p/vnUz8IyxtQ+O5LxDQbxLX9TVCi4G12LwUV
	XcHp0h8/y5gkjYtQaPGMTZnqnM3FiPKOPOr26qilUOHNIeLh0ysF53gTMCQRpO7Y
	P9ht/rAzMe4QRJchHd8+LzPGT1tTA8aYRFn0F8nB2KKQsjdQ/iONfqRE88Xxb0WY
	izWgmejpfz2+McfxAiUPg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793961725; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PGRvY3NAbGlzdHMueW9jdG9wcm9qZWN0Lm9yZz4=;
	s=fm1:rsa-sha256:i0g27YW8puF1O5C98nKWRinhr0sdofzhFBTJmF62L6v4HZx
	+8NHPn/X3nI0nbPlKxvWd46+c4gDvg1OPfaYrMdQX/UlISW55aWlNegRAlD0SwlB
	/icGOR+OMR0tNAMBIB9yMP5m3GvOyGrZFcqsGtNjJg+UmyQXp2/oIxMRiVdX3bup
	YhcLeJ+m4ah37Kwm7cotF98hW8rp/QW9SpfAAB1zXmtNwKAEb2A4LasSsejyEnkD
	Wyo5nfuExE4sFcSdN5ooecq/kORnE73uO+0i0OKYuRRU2CNhMzzQ1hIjbxo0QpOy
	wW066OfY0gD8bN/CLoM4DifyFWObh0tMv0fbyYg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:xjTO7WJkWA4/Nxo4FgbbkSXYF/p/vjOVAUk6etJKh2o=:7h2P6ehKNnf76KFV9v5StGUCTi3cufI80/RWpLYsQ6o=;
X-ME-Sender: <xms:_a7tamGutNZXq6wOCy27pl2QiIuwjnwL088fZUupbLJ5fD6FUBRhDw>
    <xme:_a7tagS_AaNbFzM4qM3ccO3CDOdO2I_NZ_Wh34meArWS8e1AptEZ6vpOEv6BJIeGa
    ZokItVWNMytUodha8sCDtj_WtV7Kp6uFx12MXbyIBWJzL5zlFDrcu8>
X-ME-Received: <xmr:_a7tars0Rd9XyIFROsluSB6ClnZ5iF1zuf0I_DyfPBx8lTQ3F8qip77erOoHkW1WjDpuRWoGxpcF6CLWgbOU1i7ooYs3>
X-ME-Proxy-Cause: dmFkZTGhJ5DY3//Toj39JGMm4JgSdDdfXflIho3jru6cpEozUChxiFTDNl24Haw9IfTu2u
    N0HWKsyNMWSMfZH4cClAGSu+uXwF+s/jJX5djmgVrT1scTRDDbLyM0QScyRmLoRVYiruH0
    ejotsViAqaeMjM0DFxZvNfNDgu3CMkuIwWx7H15Kp8+0ueRVa+g96VETvhmIrthTIDtxKd
    O0+WZaJFvE5idfy0kOmxJIt2oW18TIp4xfXXX3nmT1iLqUinrXWjYNdId1h+NzoL8dOrtQ
    0TQmC5ynbRi/WUzM+PYOR3p7sUqPxp2K9nVq/Rg2YiTcwPDH44Vx1pg1nIpwuk7jNTtTd5
    jQ6jsvhM2iu2D8PmuFxptP5ORYcz+rt1kdG6U14DJShI6KLdBOLW/1OMLb8mkX1Du4K22C
    2Kw32bNR1OkpS7lacasc0aA7tZZ4vev7epwC5/JzYY8IhdpXh2xYl5lkyOXOZpbnoK+iBT
    4Xmo4Y6yTh0KBUAWQMYFLVdfEZWvEueawpuh96SAnxK8SlRLSsOAIIMmydOOksfQFC2rQc
    qFdlsVaucR4KYjoLTlKK8mpCxn3eYLWSKDTYvFV3t+Fb7eSVZgUfollVkMwSVwfr3HAcv0
    OYMuJQiy4NY1YUCrCiTB2Ur+wscgFjiJ82w5mnnqy7X/z9tbcatbJcw90uMg
X-ME-Proxy: <xmx:_a7tagK3rPtjLkRBDMeyIsIplvEpNBqCp7L89fUQw3mpEdC2v2pepw>
    <xmx:_a7taokSkQ_OgGxAoINs7gJCqEhDpGB8Oloak_O44ujdkjc-ItUc7A>
    <xmx:_a7tahJqpb-QgvD8gvaNFbx82faRSd7SYkdWb-hKV_I1GPVx9kQMZg>
    <xmx:_a7tat4kyAFPw8ALGZSvto3Cg6x--kel770HorM-DOEcWomi-lrsmg>
    <xmx:_a7tagWTDcXFL6_QPKQXZFy_mhKUDUn0cy-hPWj-QIdUbw96RyTxlpS_>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Nov 2026 05:42:04 -0500 (EST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Nov 2026 10:42:03 +0000
Message-Id: <DMO2CUDCRHP6.2CZ9QU14HZU2B@pbarker.dev>
Cc: <yocto@lists.yoctoproject.org>,
 <openembedded-architecture@lists.openembedded.org>
Subject: Re: [docs] [PATCH] contributor-guide: Adopt new AI-Assisted
 Contribution Policy
From: "Paul Barker" <paul@pbarker.dev>
To: "Antonin Godard" <antonin.godard@bootlin.com>, "Paul Barker"
 <paul@pbarker.dev>, <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.22.0
References: <20261102-ai-policy-v1-1-db2e89267a1e@pbarker.dev>
 <DMMHOGIG8FZ2.3EGLH78Y5XISP@bootlin.com>
In-Reply-To: <DMMHOGIG8FZ2.3EGLH78Y5XISP@bootlin.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Fri, 06 Nov 2026 10:42:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10775

On Wed Nov 4, 2026 at 2:17 PM GMT, Antonin Godard wrote:
> Hi,
>
> Thanks, will merge to master-next with the following formatting fixes:
>
> diff --git a/documentation/contributor-guide/ai-assisted-contribution-pol=
icy.rst b/documentation/contributor-guide/ai-assisted-contribution-policy.r=
st
> index 7b8ee8284..f35b58fdf 100644
> --- a/documentation/contributor-guide/ai-assisted-contribution-policy.rst
> +++ b/documentation/contributor-guide/ai-assisted-contribution-policy.rst
> @@ -11,15 +11,15 @@ include non-trivial AI-generated content.
> =20
>  A *contribution* is anything you send to the project, including:
> =20
> -- Patches, commit messages and cover letters
> +-  Patches, commit messages and cover letters
> =20
> -- Review comments, discussions and other mailing list submissions
> +-  Review comments, discussions and other mailing list submissions
> =20
> -- Bug reports and comments in Bugzilla
> +-  Bug reports and comments in Bugzilla
> =20
> -- Security reports sent to the Security Team
> +-  Security reports sent to the Security Team
> =20
> -- Wiki content
> +-  Wiki content
> =20
>  *AI-generated content* is anything produced by a Large Language Model
>  (LLM) or other generative AI technology, including output from AI
> @@ -49,17 +49,17 @@ General conditions
> =20
>      1. Contributors should ensure that the terms and conditions of the
>         generative AI tool do not place any contractual restrictions on h=
ow
> -       the tool=E2=80=99s output can be used that are inconsistent with =
the
> -       project=E2=80=99s open source software license, the project=E2=80=
=99s intellectual
> +       the tool's output can be used that are inconsistent with the
> +       project's open source software license, the project's intellectua=
l
>         property policies, or the Open Source Definition.
> =20
>      2. If any pre-existing copyrighted materials (including pre-existing
>         open source code) authored or owned by third parties are included=
 in
> -       the AI tool=E2=80=99s output, prior to contributing such output t=
o the
> +       the AI tool's output, prior to contributing such output to the
>         project, the Contributor should confirm that they have have
> -       permission from the third party owners=E2=80=93such as the form o=
f an open
> +       permission from the third party owners-such as the form of an ope=
n
>         source license or public domain declaration that complies with th=
e
> -       project=E2=80=99s licensing policies=E2=80=93to use and modify su=
ch pre-existing
> +       project's licensing policies-to use and modify such pre-existing
>         materials and contribute them to the project. Additionally, the
>         contributor should provide notice and attribution of such third p=
arty
>         rights, along with information about the applicable license terms=
,
> @@ -77,7 +77,7 @@ The Yocto Project is a collaborative endeavour and our =
community is as
>  valuable as our code base for the long-term health of the project. At a
>  fundamental level, we each need to take responsibility for what we
>  contribute to the project. For example, this includes ensuring that our
> -contributions follow the project=E2=80=99s Code of Conduct. It also incl=
udes
> +contributions follow the project's Code of Conduct. It also includes
>  being respectful of the finite bandwidth that we all have for reading,
>  reviewing and responding to contributions.
> =20
> @@ -122,7 +122,7 @@ Transparency
>  **Contributors need to disclose where they have used AI-generated output
>  in their submissions to the project**. As stated above, incidental or
>  trivial use of AI-generated output within an otherwise human authored
> -submission doesn=E2=80=99t require disclosure - but if in doubt, err on =
the side
> +submission doesn't require disclosure - but if in doubt, err on the side
>  of disclosing the use of AI tools.
> =20
>  The use of generative AI and LLMs in software development is a rapidly
> @@ -139,7 +139,7 @@ In patches and commits
>  ----------------------
> =20
>  **Where AI-generated code is contributed to the project, commit messages
> -must include the ``AI-Generated`` tag identifying the AI tool or
> +must include the** ``AI-Generated`` **tag identifying the AI tool or
>  framework and the specific AI model used**. We encourage contributors to
>  be as specific as they can be. For example::
> =20
> @@ -193,7 +193,7 @@ Enforcement
> =20
>  Violations of this policy may result in contributions being rejected or
>  deleted as appropriate. Repeated violations will be dealt with through
> -the project=E2=80=99s `Code of Conduct`_ policy.
> +the project's `Code of Conduct`_ policy.
> =20
>  .. _Linux Foundation Generative AI Policy: https://www.linuxfoundation.o=
rg/legal/generative-ai
>  .. _Code of Conduct: https://www.yoctoproject.org/code-of-conduct

Thanks Antonin!

This was drafted in Google Docs, downloaded in markdown format and then
converted to restructured text via pandoc. Somewhere along there the
formatting issues crept in.

Best regards,

--=20
Paul Barker

