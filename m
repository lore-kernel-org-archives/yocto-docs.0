Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52E72E77184
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 14:51:04 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web11.130522.1734619859682561660
 for <docs@lists.yoctoproject.org>;
 Thu, 19 Dec 2024 06:51:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=XPB6pHis;
 spf=pass (domain: baylibre.com, ip: 209.85.222.173, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7b6f75f61f9so100091085a.0
        for <docs@lists.yoctoproject.org>; Thu, 19 Dec 2024 06:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1734619859; x=1735224659; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cFMIWKHsYIlRssZz0G/h2O/7tbibpVUvJQnsE5oT3CI=;
        b=XPB6pHisWGqG+XwE9h91wAxSVp6i+aduCy2muj1ZJEH3C8U29tD69ggShGNLaGS11U
         5ObO9oO0T/c6ksu56UZG4/adho6Y6BrE7FLawomTDrY1wi1iFkoV/Pn3HuTeJ0yM73SR
         RQHW1Hq7Y5n9bjkmAejdSKoFxwwWnCgDAo8zOyRi2aXem+I5JFLcWrLVgjCTuXe2kl9f
         2jUEN1AFFiMKK8pNLnLeLAgUoUzHTT7AZ1XotLYheIJwL1tAm0t8PEml6SSNcWYVWJqb
         Fj0fz/obg2GB2xlwSdU3jL4K5MtiVvqzTbYYjf4SYl7ssart1LJn6bzXUgAqvJPm+4xj
         +ZJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734619859; x=1735224659;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cFMIWKHsYIlRssZz0G/h2O/7tbibpVUvJQnsE5oT3CI=;
        b=gFyUClw7ixKRtXicRo2Zevmpi39lklbXYuP1TWgHXoIKTg9U68CiT3eBdI1GzJWSvs
         aJTfWNTQSP7YmSA1U8QeuRYVYV4D+7gryh7gnBTj2TsYQYoKoJFddKVqE0vMzjzFuL7E
         Cahj32FOpaQKXovj9+ZTdUELTGZPVGM2mVTlClSCBqHIlri61fpkB+PgrxtfcPBak9/H
         HP8AZODknZ6hgvsmGvzQSG+q9rf6/XpVTU5pQi7wxDiRhthUVBMeLhydrslKmJbEzfIP
         Gat+d7IMEppicHaXhsa4M5utNp0k2c8RIdvZkIIabsK5wi/2llWV1trzYUVR2MI8oC4J
         9YhQ==
X-Gm-Message-State: AOJu0YwXuWGKx3SQ5PS74smnDsY0fOTSy30Wp3Tb1lbqK/eXkndsl45M
	KDwNRBobEko5JxIALpiYRWdtSFX2dXoRvcj6h+IxrlY/JF8iQD5zdp5v35g+7+U=
X-Gm-Gg: ASbGncuiKfRPPuqg7BxLE5iMkeLzy4YTcZaiOp0pfGKnPalI5qsuNHl4FKDkv83Npr+
	UFzFL63TQNRWJTepp65CCVshONJ5TCuJV9GrmPE2u/eWWaXyLa+INPYeApgL7H/p6J56aOPZxUq
	S5Gf2ReWI1JA9DCGxg+U+YYGJxoWyq19BvmI6/+wc40I/zJXTfWsSpwiobiF3gJ47SmAKiOSKc/
	TvL5mdSlkvek+XzhSK/95jpFTe3WKiTdvHK1CdfFP1AvnyZ2ovXTHmyvjDlg2VUeIqZ5VE0199l
	jUTQ7Bw4xssHGy6cDY3hnZ8d
X-Google-Smtp-Source: AGHT+IECgHn4KMQBqLebHIQ2qetDYAZa8rMcJ8b2fbcAmJYmAhza6nAKV8BMYFaLA8MWMSk4JRDvdg==
X-Received: by 2002:a05:620a:4087:b0:7b6:d6ff:86ba with SMTP id af79cd13be357-7b9aaa118bamr531837485a.52.1734619858730;
        Thu, 19 Dec 2024 06:50:58 -0800 (PST)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b9ac2df84asm53973685a.33.2024.12.19.06.50.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 06:50:58 -0800 (PST)
Message-ID: <edcd3311-7019-43f6-bcf3-3e597277cee8@baylibre.com>
Date: Thu, 19 Dec 2024 09:50:56 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [docs][PATCH] reproducible-builds.rst: show how to build a single
 package
To: Yoann Congal <yoann.congal@smile.fr>
Cc: docs@lists.yoctoproject.org
References: <20241218200630.823299-1-tgamblin@baylibre.com>
 <CAMSfU+7BFDDxD4w7BsH17Gxyrvt+1SGb1QmKZRE3eENg1Fv2zg@mail.gmail.com>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <CAMSfU+7BFDDxD4w7BsH17Gxyrvt+1SGb1QmKZRE3eENg1Fv2zg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 19 Dec 2024 14:51:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5986


On 2024-12-19 07:27, Yoann Congal wrote:
> Le mer. 18 déc. 2024 à 21:06, Trevor Gamblin via 
> lists.yoctoproject.org <http://lists.yoctoproject.org> 
> <tgamblin=baylibre.com@lists.yoctoproject.org> a écrit :
>
>     Add a bit to the "Can we prove the project is reproducible?"
>     section to
>     show how OEQA_REPRODUCIBLE_TEST_TARGET can be used to test a single
>     package (rather than the world build), as this may be useful for
>     maintainers.
>
>     Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
>
>
> Thank you for doing this.
>
> That is https://bugzilla.yoctoproject.org/show_bug.cgi?id=15619 (you 
> may want to take it and add a [YOCTO #15619] ref in this patch)
Thanks, I'll do that.
>
>     ---
>      .../test-manual/reproducible-builds.rst       | 22
>     +++++++++++++------
>      1 file changed, 15 insertions(+), 7 deletions(-)
>
>     diff --git a/documentation/test-manual/reproducible-builds.rst
>     b/documentation/test-manual/reproducible-builds.rst
>     index 91f94a5c7..d581155eb 100644
>     --- a/documentation/test-manual/reproducible-builds.rst
>     +++ b/documentation/test-manual/reproducible-builds.rst
>     @@ -91,13 +91,21 @@ run::
>
>         oe-selftest -r
>     reproducible.ReproducibleTests.test_reproducible_builds
>
>     -This defaults to including a ``world`` build so, if other layers
>     are added, it would
>     -also run the tests for recipes in the additional layers.
>     Different build targets
>     -can be defined using the :term:`OEQA_REPRODUCIBLE_TEST_TARGET`
>     variable in ``local.conf``.
>     -The first build will be run using :ref:`Shared State
>     <overview-manual/concepts:Shared State>` if
>     -available, the second build explicitly disables
>     -:ref:`Shared State <overview-manual/concepts:Shared State>`
>     except for recipes defined in
>     -the :term:`OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS` variable, and
>     builds on the
>     +This defaults to including a ``world`` build so, if other layers
>     are added, it
>     +would also run the tests for recipes in the additional layers.
>     Different build
>     +targets can be defined using the
>     :term:`OEQA_REPRODUCIBLE_TEST_TARGET` variable
>     +in ``local.conf``. For example, running reproducibility tests for
>     only the
>     +``python3-numpy`` recipe can be done by setting::
>     +
>     +   OEQA_REPRODUCIBLE_TEST_TARGET = "python3-numpy"
>     +
>     +in local.conf before running the ``oe-selftest`` command shown above.
>     +
>     +Reproducibility builds the target list twice. The first build
>     will be run using
>     +:ref:`Shared State <overview-manual/concepts:Shared State>` if
>     available, the
>     +second build explicitly disables :ref:`Shared State
>     +<overview-manual/concepts:Shared State>` except for recipes
>     defined in the
>     +:term:`OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS` variable, and
>     builds on the
>
>
> What do you think of adding that a quick way to test the 
> reproducibility of a recipe is to do
> OEQA_REPRODUCIBLE_TEST_TARGET = "recipe"
> OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS = "DEPENDS of recipe"
> ?
> (If not, leave the ticket assigned to me and I'll get to it eventually)
>
>      specific host the build is running on. This means we can test
>     reproducibility
>      builds between different host distributions over time on the
>     Autobuilder.
>
>     -- 
>     2.39.5
>
>
>     -=-=-=-=-=-=-=-=-=-=-=-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#5983):
>     https://lists.yoctoproject.org/g/docs/message/5983
>     Mute This Topic: https://lists.yoctoproject.org/mt/110186946/4316185
>     Group Owner: docs+owner@lists.yoctoproject.org
>     <mailto:docs%2Bowner@lists.yoctoproject.org>
>     Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub
>     [yoann.congal@smile.fr]
>     -=-=-=-=-=-=-=-=-=-=-=-
>
>
>
> -- 
> Yoann Congal
> Smile ECS - Tech expert

