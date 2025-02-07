Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCC25C02194
	for <webhook@archiver.kernel.org>; Fri,  7 Feb 2025 15:49:03 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.72730.1738943334512816437
 for <docs@lists.yoctoproject.org>;
 Fri, 07 Feb 2025 07:48:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Gf5G5oZ7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-436a03197b2so15299845e9.2
        for <docs@lists.yoctoproject.org>; Fri, 07 Feb 2025 07:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738943332; x=1739548132; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LkB34u76Lq1FsnIGRm07pGfpwESLEqbEj1U6ensY9dE=;
        b=Gf5G5oZ7884jrumse5UhCO2J7UxL3oBMDIvzQCaPBnJfMpDbXAX71fLsjdFS64DHxx
         pcEeZEVcFWK1LHAowBX8Y7VddQZPXqI21G9lGMxru3UcK8ZFKi4eFoQm8Ep4NNDyHnc0
         Kk7f9Pt2GK5qLZjYBCyV1/gW4ZUiZKPdDMAqs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738943332; x=1739548132;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LkB34u76Lq1FsnIGRm07pGfpwESLEqbEj1U6ensY9dE=;
        b=WHBE1nrLLKgPN5J9NWALD2PjE8ox2ACl65UJ7QJzObyiK1dWPR14Zb3QjGvsTkF5pG
         c40lHLbn/U4W7RX2V5rtaN8w1rgSM+Ebne2skFY7UKtMqvoqnIYv0O4H48PFTZBdbDqN
         BJ3J/iF0uYMlEpOqxk2xrt6TF9AHcUif0DuaGOww4h3poaSdUX7juDMNq3woJfDihDuz
         olfYzPMqvYOIILDGvqiQ4LgMh2klKT9gGT9lzJj3xDg+h/DUEmd6IH/c2VkCwP+aI/eg
         QklrmQlMZioyiiZWWhz3dyTiRleQTiRiccNXtlDr1vFfquWWPuY68NDGia58s+aFoAwZ
         4mwQ==
X-Gm-Message-State: AOJu0YxSmWM1U6lD+Kkvdf6zPUEXsMZC/eL4UAYSU4Yd99eDnyquiRc1
	T8T3oHV1IefpYeqUWRLvPIzP/Pvti/Rm5qwxYr//Fw2kLv9Zgd5iSzcVPboWztgGa8aveAHXo1G
	1
X-Gm-Gg: ASbGncu21UKvhqzRRnCWTkah0cPlXtJOIfmFfwDI7sIvw5136YnAvlzSoPK+aP3Y+AC
	DQDqO5U3auofa61DrgcDKeu+zrF4Wyxy3pbsI92HSFKbR0dxm6VDZZDWzja6i36CS3oEgpFEdiK
	gTvE6AT8tkwWiAyGAIl62d67f19zPmYQNjBvf0sRNsvR8wnTdbncvU2mFhgDlkieAFgAp+1l1oJ
	roTh6KD1yPA9WALslNz3UeBRrCtgppFGk6DZ8iaxu7eCqfvBRljF4AEo8jgMaRnkFms5seiNQtn
	xbx0QWYtQbAT4RHBK2pjEEmujNNg1HrC79l08Ha6MaXhi/TjHONVF/J4BMjd26CTHmOYWSvsQ+A
	tGEQu
X-Google-Smtp-Source: AGHT+IEpun8dWotnxEaztc0UPn3917O9csty6YHfgNB5AqZyQdL/Wia8fCqQBtqDUGSFtH6uAVc/IA==
X-Received: by 2002:a05:600c:1c07:b0:434:a315:19c with SMTP id 5b1f17b1804b1-4392497db5fmr34178335e9.3.1738943332543;
        Fri, 07 Feb 2025 07:48:52 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:dcae:28d1:c97a:4196? ([2001:8b0:aba:5f3c:dcae:28d1:c97a:4196])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390db10b2fsm93185955e9.33.2025.02.07.07.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 07:48:51 -0800 (PST)
Message-ID: <a4606cf6bd294d296577f5276497c4b8905d2284.camel@linuxfoundation.org>
Subject: Add AI Code submissions policy to contributor guide
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: docs <docs@lists.yoctoproject.org>, "antonin.godard"
	 <antonin.godard@bootlin.com>
Cc: tsc <tsc@lists.openembedded.org>, Yocto TSC <tsc@lists.yoctoproject.org>
Date: Fri, 07 Feb 2025 15:48:50 +0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 07 Feb 2025 15:49:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6300

The YP TSC received a request to document whether the project accepts
AI written contributions. The Linux Foundation has some information on
that and after some discussion with both the YP and OE TSCs, we have
agreed to start with the text below. I'm hoping Antonin can help us
update the contributors guide with it. We agreed there may need to be
minor edits to get the tenses right (e.g. you vs contributor).

We're basically trying to take the LF text, extend it to say our normal
submission process applies and that a human must write the signed off
by line and review/send the submission. By doing that, they take
responsibility that any copyright/license issues are handled. We've
tried to keep everything minimal but copy pieces out the LF doc in case
it changes later.

Cheers,

Richard (after discussion with both TSCs)

"""
This is based on the contents of:

https://docs.yoctoproject.org/contributor-guide/index.html

as well as the LF:

https://www.linuxfoundation.org/legal/generative-ai


4.10 Acceptance of AI Generated Code

The Yocto Project and OpenEmbedded follow the guidance of the Linux
Foundation in regards to the use of generative AI tools.=C2=A0 See:
https://www.linuxfoundation.org/legal/generative-ai

All of the existing guidelines in this document are expected to be
followed, including in the recipe style guide, and contributing the
changes with additional requirements to the items in section 4.2.4.

All AI Generated Code must be labeled as such in the commit message,
prior to your signed-off-by line.=C2=A0 It is also strongly recommended,
that any patches or code within the commit also have a comment or other
indication that this code was AI generated.

For example:

	component: Add the ability to ....

	AI-Generated: Uses GitHub Copilot

	Signed-off-by: Your Name <your.name@domain>

The signed-off-by line must be written by you, and not the AI helper.=20
As a reminder, when contributing a change, your Signed-off-by line is
required and the stipulations in the Developer's Statement of Origin
1.1 still apply.

Additionally, you must stipulate AI contributions conform to the Linux=20
Foundation policy, specifically:

	1. Contributors should ensure that the terms and conditions of
the generative AI tool do not place any contractual restrictions on how
the tool=E2=80=99s output can be used that are inconsistent with the projec=
t=E2=80=99s
open source software license, the project=E2=80=99s intellectual property
policies, or the Open Source Definition.

	2. If any pre-existing copyrighted materials (including pre-
existing open source code) authored or owned by third parties are
included in the AI tool=E2=80=99s output, prior to contributing such output=
 to
the project, the Contributor should confirm that they have have
permission from the third party owners=E2=80=93such as the form of an open
source license or public domain declaration that complies with
the project=E2=80=99s licensing policies=E2=80=93to use and modify such pre=
-existing
materials and contribute them to the project. Additionally, the
contributor should provide notice and attribution of such third party
rights, along with information about the applicable license terms, with
their contribution.
"""


