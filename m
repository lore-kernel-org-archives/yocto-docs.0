Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 680CBC433FE
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 12:13:10 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.52])
 by mx.groups.io with SMTP id smtpd.web11.2428.1667995979211621580
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Nov 2022 04:13:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1 header.b=VaIH9koy;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.7.52, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MQJ3srVGuCG9SH73TVqwX+ucRSYwtYlml5J5wmBt7/hIRIrJG3soykhcGPkS+dO9p7vXxE1iadKKSZRCZ+YgkN85DgDLOuZekKYa0Vc/iAmLueh9YTNAPdWkxJ7A+r8JmT6+27LowZZmQkD6aRo53SR9brlnztbeFKC0k8mW+DXjVQLzRFPWwkEcXpmHqH8smxdIVh/X6pkfTjv+IwPdaShFQtYQEFPpEWRGAgDwe7oA07rS+KfOaSVRYoPuLGJl5ZMotmvp0OzQwrn2iNChJ4dZvUDNfsS3VoCIKroGDyIzbp3a2xO1WKH1QU3o2HJEZgRWV7pNv/LItzfOJkGYmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i0UBbxeDrsxHSVvtOenytubvuSh0rRhq4PZnfIyogDI=;
 b=ESJKQfMw5dLqadeOQxVn/KbESqMqeSeDKJDFlAXkbLCjB8wsvWnLA4MyRxraQQlQOJpvN7h76S8SwGvHpRQitVd+dm+VjIDO5J1kPX/1BBtnLNctiWTTZEy1xWro04rrT1Ep5wqcX9jMChewhAB8xH4r3sORhJGzjm16I4dF9T404evwXsVboqe/GoZoXgSLVuXZZFso6a06YRq0ojbf5nmRsX24tGR8WpNe1c5uejCoCis2vRiFm/4A2jFsrJcvK3iYcHLzbA3n7qt2J9uUrsOEv85O0HREOLd7hKoWoLIvYUq2H4Qpvs2Jo7IJ9b5U0c/n3D+hfENG7G0XsZM6wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i0UBbxeDrsxHSVvtOenytubvuSh0rRhq4PZnfIyogDI=;
 b=VaIH9koy+rR39Cr/cWZMcVqyZHmnmYkGeMb7vdhZkA9E1kO2xpDAZMxmUf0UdOt5+6jjWwMHrwROnDqeECwKP3kq0x/lr5txTdh5PJSBC4Qj/qFf6E8bK8bm8qP1FbhPUCjdCzg4eonn/3MIwlJ2L5md0qnszJ/YmlH2+zvcQUqBWt08iiXUGE3wFDED4hyIin8e552L0nIY65xoiIDH1aVHy27kPPDt4IBkxh07PWh8VXG4rd0wwZPlibaVMs+v2CA5riNGwEn4Th3MM2EA3BKFLlvRTu7WSwRiYh72UHzSF6u4cxCxx4cJu78oq2bGlFioH/8On0q39UOMvLr3Cg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by AM8PR04MB7875.eurprd04.prod.outlook.com (2603:10a6:20b:236::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.23; Wed, 9 Nov
 2022 12:12:55 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833%3]) with mapi id 15.20.5791.027; Wed, 9 Nov 2022
 12:12:55 +0000
Message-ID: <65858fd2-0b98-a736-42b0-be168e99c842@theobroma-systems.com>
Date: Wed, 9 Nov 2022 13:12:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [docs] [PATCH] qemu.rst: audio: reference to Command-Line options
Content-Language: en-US
To: Atanas Bunchev <atanas.bunchev@konsulko.com>, docs@lists.yoctoproject.org
References: <20221109115018.16086-1-atanas.bunchev@konsulko.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20221109115018.16086-1-atanas.bunchev@konsulko.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0129.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::15) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|AM8PR04MB7875:EE_
X-MS-Office365-Filtering-Correlation-Id: aa5b2756-d576-4667-f91b-08dac24bbbae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yT+7lcroqkZVWZ9FMGfcHBWKglJBhaZQT1iDW1woxPh6aKJROP1C9ogueiJeWjRzMRvyxcM/Y8OBJIzA8GBke4Fn/z/1J6ia3ykCT25IH9jkE/AA1079sEa98JDIIGtO3+B7TuU8jy9JSAhmK2tzaymqA/RJ8f0uDnxwGGBH1pclp43cBlLne/A56rzRAYS9ZcFiCdh8bp+qMdquboHaDLslK6x+fmvvUAC5m2boqR4UlzMHog9qwYKT9dksY89zpeNZ+EeTQ5c151EyGErJ+ehSNIUTEk+dRuI1T37sKrTZm8XaLT7tBvwD/2EpJcH4qP22297tATnTJ8O1TpP2i3nuv51K5eoegQHYCx0xNS9v5RQpCI5xI+BJLVLFBlqsYQ/BJU71duEr3nIprPXYrsOb8BEpxVx/QJPCjuTVGKB/MB0tVXAARPO3+rBphJjrC67iPPIXwt/tq2LHezq2R7xW5HsFTg8ILDcvWDHy5WbMkI9MU9X5pSULK5xjVReajV0OdHKBNhDBeMevWoEMSUAZc5D3DIEOnjgg23o7nbF+zKxD4EreJ/OpuyvtJ/madbxKrlYdSjMiP73WFa11Uoqd4p5FeBBeYE+moBo82mnqNj6Fa+EF0uUoCaL+2UUzXFPgECnpdX1AT3iM5Ekg9ssytK6+A47SHZQsOZYshpZqQoqz4qIPuBM519bjk7Hw/yv1MstWuIrA+GGZ6QFY9LxvOPtuEbsPtNbqVHPIuMIIxGlPxKDUxK8nChQG9Ia32Vil+peDon9buQBfUveqJSDg38GA1q2ZSMnO+BZFNBM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(136003)(39850400004)(346002)(376002)(396003)(451199015)(53546011)(478600001)(26005)(6486002)(44832011)(38100700002)(6506007)(6512007)(31686004)(66946007)(66556008)(66476007)(316002)(36756003)(8936002)(8676002)(2616005)(41300700001)(186003)(5660300002)(83380400001)(86362001)(2906002)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZURVdnl3ZmlWd1hEM2JHWU9KZnoyUlA0YmpUdTdibGR2alpnMGhuV0RKVjQw?=
 =?utf-8?B?WWxWMnNvMlZtOWZtemZ1ZmxiZUtsWjhJb0NiaS9wMFpFK2NoM2t4aC9PUWI2?=
 =?utf-8?B?VGxKUy80Qm5QV0lZV1ErWTRqNzFOaVBsN3ljcTZPblpzaHFnNG0rZDdQbWJ2?=
 =?utf-8?B?MitiOEVtdHNYNlJLSmdSRDl3L2FHeU4wYjViVWh2VWNKUnlPVlF6aXlZV3NO?=
 =?utf-8?B?WkhTZnY4UGpMazIvYkdHeXoxU3d2QlRNa0x1enlNQUZJTDNVVVp1c2tpQmF5?=
 =?utf-8?B?elkrNjRNd2lVUHE4Y1NsaVlDdzNTSFBWN1hKY2RJYkVoVDBZVThYblB4dnJQ?=
 =?utf-8?B?YzVWdlpkam1UYnVqVW53MUlDS2xKUUdpakR2dzdYY25IUVE5bWVSOGFXbXlE?=
 =?utf-8?B?bDR3T0NlMS9LOG5qcWE4OHRYR1M3RmZGMDV1MTBxdzZmRy95Vk13aDR0MXk5?=
 =?utf-8?B?ZEl5c1JhdVRXamFsR0lNWG0zNExYWVBCR2tUTHRsL0tnWUpvbmVDRXJveS9R?=
 =?utf-8?B?UDFYS05uSnBPcUpNeGJ2MU40dGEyTUQrQytXYVYxdlB0TjIzNHFFbmJYbGRI?=
 =?utf-8?B?cVd4OVlMMG4rYnp6MlNGYVdSRlJiZWV0UlVYL3k2WFQyZnd6cXBxTlNUZ2ha?=
 =?utf-8?B?WE0vNzBPdTcydVFrQXI1ajhBM3p5L0pGV3d5VnEwS0cralJuRDdlMHNLQWFh?=
 =?utf-8?B?TTJ0SHN1MVhlSnZJUlI4N1d2SkNXdVhvSUxHYmxiTzI3VVkzeUxiVHNzaXhB?=
 =?utf-8?B?UHJJWUhNckc4L2JOanM4Wlg5bFRxK3VNcnRzdnc4cU44OUp5bmJwUzF3QlM0?=
 =?utf-8?B?WTdEV1NZRGQ0MGRkdmd3ZHcwYVliRTdxYkdURmplVHB5Ny9xNWdTeW9DL0g4?=
 =?utf-8?B?YnNxeU5VM3J0Qk44NVVpdVhXaE9nbFRLMzZzZ1pIZnI1SUJBckpJa2tXRURx?=
 =?utf-8?B?dm5PYzRDOGYrck5iZmNGY0dwa1ZNS0JBZC81OUdUYkdqWVRSRGV1U2ZpSFEy?=
 =?utf-8?B?OGVidlNwQUZTQ2RvYTFrOEl5SzZ4TXFpUHhIVXBkVU9nK0JWZDY1amF4V2tR?=
 =?utf-8?B?UWt3aWpaYUM4dmZrVFJ5NHhKQWYzME05cy8vTGtremtCcmJTdko0SlBGY0JI?=
 =?utf-8?B?cnlrRVRTVUJ1cFViSHVUYnU5KzNLQ1F3WDkxZmRyanJIYzcvWW1xVFdnaVJN?=
 =?utf-8?B?bWZGdDc2TXFETG9CdVhMMVpteCt4YUFEaGVkR2RiSVdsbUdtN2sxTzBsVEkx?=
 =?utf-8?B?WkppdnlRRmN2SGpyY1FVeHo4bDdHWkxpeWFremlFMDZzSCs2aGU0MGF1Qktr?=
 =?utf-8?B?MXhSa2VYWUtjTU1nbVQ0a3NnMVY2RFJvZzRRZytNOGF3U1dHczNkY0R0bFAv?=
 =?utf-8?B?eHRUOVY0djJpU25aVys5Q2Z3bGFOd3ord1RyYVRFeWpjMGJPWWpkUHhpTGRY?=
 =?utf-8?B?Zlp5ZzZFTk16VnVwMm14SVJEejA3YlB6bVREdFBIKzJrd3JMZjgwdUwyYmdW?=
 =?utf-8?B?RmRnUGRnNlgrQWNxYXM4aGVGSGx5cVpxcWpyUW1rSzdnOUNWODU3RDZmOW4v?=
 =?utf-8?B?d2lkTUpsMnd1NWFhMVMvV2VFSkxKSnlSRWpkeVhKYjcrSS91TTNnSUZpZzdq?=
 =?utf-8?B?c2w1WllVbGo2Y1R4VnIyM3Z0MnFGSVd2VkdvOXkwWDJxZ2JickpnbytGbyt1?=
 =?utf-8?B?U25EUE0xZGdZMEpIYzFzQzlZT1dvYnRINGIxN2xuUG55YUpZSW1aczVmcU9p?=
 =?utf-8?B?VXNRYlUrWFgvemd1WmtEeGZ1QWFHamY4bVFwcm1LSFp4MDNnUThsejlmWDcx?=
 =?utf-8?B?eUIvaDhIOS96U1VsUUl1YTFhcHZnaHZQR3E3R3VKVzk0V1MyWWUwNDFoSlBJ?=
 =?utf-8?B?dEJlVm4xdDdvbnBHYzB4VWU4anBhc2EvVFRVcDN6bmhyaUhKVVZOSDZUWlFW?=
 =?utf-8?B?MDVjWkxiTlZwSzVTdlBITzcwUVlzN2QrTzhDWGxUSDVsYVAwZk5CQVJEV3Vr?=
 =?utf-8?B?TS9sOStRNTRUNHFpQkFwaktDNzJZL0dmVXJ4NWZURnJWaTE5NFJWVGFnbmRh?=
 =?utf-8?B?R3lRb3dzNXEwU3ZjVnNjblpSRWMzclhaY2thZlErbjVON2M4b08zQ1dyamIx?=
 =?utf-8?B?N0xFeEYxRjAzRjR5K2pYTWdFK0xJc09KUlpDRFdPa2xYOTJwbE43YU9CK1Bi?=
 =?utf-8?Q?xaQVI2B2oJ7EDoXeg5szixM=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa5b2756-d576-4667-f91b-08dac24bbbae
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2022 12:12:55.4738
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B/4JMdfe+vUEIjfPkaRVm2v3YtBbFC6KFXmCR4tupWm30uwgky6v/XzUE6736eYjf5qZuTYcNeGSnnx9v6QAAOGexgdrKgiWf9zHifmHijvY3sHu3Wp9+2Bq3rxgVOLN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7875
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Nov 2022 12:13:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3480

Hi Atanas,

On 11/9/22 12:50, Atanas Bunchev wrote:
> The previous statement can cause confusion, because this is the
> first time when the `audio` argument is mentioned.
> 
> Signed-off-by: Atanas Bunchev <atanas.bunchev@konsulko.com>
> ---
>   documentation/dev-manual/qemu.rst | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/documentation/dev-manual/qemu.rst b/documentation/dev-manual/qemu.rst
> index 5a4a82ce6..4fcfd0686 100644
> --- a/documentation/dev-manual/qemu.rst
> +++ b/documentation/dev-manual/qemu.rst
> @@ -125,8 +125,9 @@ available. Follow these general steps to run QEMU:
>      -  This example specifies to boot an :term:`Initramfs` image and to
>         enable audio in QEMU. For this case, ``runqemu`` sets the internal
>         variable ``FSTYPE`` to ``cpio.gz``. Also, for audio to be enabled,
> -      an appropriate driver must be installed (see the previous
> -      description for the ``audio`` option for more information).
> +      an appropriate driver must be installed (see the description for
> +      the ``audio`` option in the Command-Line Options section below
> +      for more information).

We can use a reference here so this always is up-to-date.

I can suggest the following diff:

diff --git a/documentation/dev-manual/qemu.rst 
b/documentation/dev-manual/qemu.rst
index 5a4a82ce6..8f70eec10 100644
--- a/documentation/dev-manual/qemu.rst
+++ b/documentation/dev-manual/qemu.rst
@@ -125,8 +125,8 @@ available. Follow these general steps to run QEMU:
     -  This example specifies to boot an :term:`Initramfs` image and to
        enable audio in QEMU. For this case, ``runqemu`` sets the internal
        variable ``FSTYPE`` to ``cpio.gz``. Also, for audio to be enabled,
-      an appropriate driver must be installed (see the previous
-      description for the ``audio`` option for more information).
+      an appropriate driver must be installed (see the ``audio`` option
+      in :ref:`dev-manual/qemu:\`\`runqemu\`\` command-line options` 
for more information).
        ::

           $ runqemu qemux86-64 ramfs audio

What do you think?

Cheers,
Quentin

