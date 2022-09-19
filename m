Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D312DC54EE9
	for <webhook@archiver.kernel.org>; Mon, 19 Sep 2022 15:34:51 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.60])
 by mx.groups.io with SMTP id smtpd.web09.493.1663601685102630140
 for <docs@lists.yoctoproject.org>;
 Mon, 19 Sep 2022 08:34:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1
 header.b=AbVISr2G;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.0.60,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TdjWZdInVPhCeXuzqP05sLzDqlWxs9d2jVZv1UXDpIDXPylP1vA4dmruMvMEKsRlpiggWas0FcevIMG8gt3EvwQGxEEn4a8C6l784CkYRwOAIJaeavCq5tPnEfG9Y4Ch6Dq1mZgbLThvcpj7GcYi8QtDHNwD0KYkXzNww8tXDg/RGa3x7uNVfHXwFUrOgjqu5Jp2DOAZyHloSIslzEBvIOic2lwuokyyTo8kTM7rvJKuFU+HX67Cl9khjyXQn47qUKORwV/arFSKl9LXK7ab+yEm8VPa/6O8wEqDpt3ZUIYKOFvMdl7bISlXnOAdyfTvAvJ1RIAIBIubc6KdZnA0EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LsvSdUX+BZdcL5WPhKWnck5rh8+o9gSKzOb9u5EOhjY=;
 b=Cd/LjoKZAP9k5tgaCT36GlGz5iel9r9TbD3fzz215YBS06oTDYaq4nIc7ZXjyn9hgom6tbpU13jak5Soh3NPC3dpa96oOtuDCBDi4pgqD/763cElht2M7Yb5tDAVHgbA6DXCL9UF6b7QAqwDCa3g/6+/tdWNDoXRHwsbMKQHHWIsXmsAXy/U6/1fA1I/fNDCg3VR7UP4prhZ7IQ/0vhe4PgZ0chVPcxByXRwqt8rEaNpOBGh15vEVwV+6E72GMxenDm6c3c4TAG4mFTUa5VbswLdHOQIUMH4frO6nAa22yw9OzcQ0QUcdeXTEIbCbyODAcebTUiVF41RBhHg2Rb9iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LsvSdUX+BZdcL5WPhKWnck5rh8+o9gSKzOb9u5EOhjY=;
 b=AbVISr2Ghj+sdFd9XHR6cQflk4ulkBstsQWlTBSzq8NIDUC/RNlbTKT5sL06Y34f5I1MPTFumhEyZuO6yYSU1ltS708NGLr97Ln/dEDP7IYsjEUiRJ76lNaEGqO80aHF8nYBg1DgmX+IuO9mkYLNdYOnkUEkGilFMGlY+9mKNe344gwGuLtm06mzOfly53p/WYsOo6CpCU1MoJAGljwZ/gjQHnJu2s3Up4gu6o7rrzIEEklt7ZgRS4zhR7RxFyF6gzBauSIkvhgbSo42jOOVjaPt45Ly75l2O2aZcSoNgWKl5kcQ5Qub/Zlm/okpcl9m0sBpReF6A9fu7FGmE1YFTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by DU2PR04MB8552.eurprd04.prod.outlook.com (2603:10a6:10:2d7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Mon, 19 Sep
 2022 15:34:41 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833%3]) with mapi id 15.20.5632.021; Mon, 19 Sep 2022
 15:34:41 +0000
Message-ID: <97fa0bf6-8805-d541-c4ea-bf7801b9d9bf@theobroma-systems.com>
Date: Mon, 19 Sep 2022 17:34:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [docs] [PATCH 4/5] common-tasks.rst: describe the layer setup
 tooling
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>, docs@lists.yoctoproject.org
Cc: Alexander Kanavin <alex@linutronix.de>
References: <20220911172608.2542076-1-alex@linutronix.de>
 <20220911172608.2542076-4-alex@linutronix.de>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220911172608.2542076-4-alex@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0059.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::21) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|DU2PR04MB8552:EE_
X-MS-Office365-Filtering-Correlation-Id: f1d9cac5-0124-4352-5cf3-08da9a547830
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IUVKEpZLwwme23MjLXRbZ+ZTCYo1vK7P2xPj6kp3Vpjpy6vJRvrMFXYRzaytPPBxiX440s+17GuzziuWsjJgJMnUXJONhnWwW/k+H4lnxeragk+w72PM9e1xoHlAlwfj1TkSDmTfYmftaJ2OiDt4uDNO4WVw/zSzxT+QorW7mitJfUEhWqYqspEL2xXWJB0RqUC+5veJ5Pn0cTaApCmnZOJse1hgSv/LKvnlzpUkgIg+u+O3/PilYOmWA+e19qjNbTA74f1/nmjQhb0dmpkbAyQs5qW2I/srd6PdsaBt0NEXjF8gFjs+xUKIPtPGfADoxZAcYLuqcMqBlOlp+gBKk4rqdBXaa7z/iUSyUNM0Vc7bWxtlWBER5mmPtgp+mdJbezZ2Vug2BSZ5xnX9EK8IGMz3BfI/uVWZ7UDM9Nwy9N/Gj2wabLUGIME2TX9AnkkzqiqCtVXWQ6ojaYschfyqTU+3L9tmQzAaqX+zK6mSn+Bpog97gE2Wpubech7PY5DQ/iUirDVzaIT2l/+VSZCfeadAN/H7kQ9maqkuvdhGpgoCweK46MjWLlJn7RLN/11HVTrkzHr+UuUc+EZBIVDi03POuMgjeVtuu0q/B2Y4eqNcSmAN9dy2uvjjYTFnxhnimcqCJccOLqf7M5eC1GF6JrV44wlGdZv0bTIspewexx/dd8tuoSZUyf43fmZeJro+opWhV1W5bgyNmEgL8BHnZ4owy9wVQAbZ50QJ4TvKGwww3KtM+Zq1kFM35JlBs0Pi6Okfzw5eNbqKfq84YRi0Tcr3dTEt7SOntrivNvZQxAc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(136003)(39850400004)(396003)(346002)(366004)(451199015)(66946007)(4326008)(5660300002)(8676002)(66556008)(66476007)(31696002)(86362001)(8936002)(316002)(38100700002)(83380400001)(53546011)(41300700001)(6486002)(6506007)(478600001)(2616005)(186003)(26005)(6512007)(31686004)(44832011)(2906002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZDRIU0NEMWZlRDdlMUJOWjFXQTM0aFZaUEVhUGFxKzYwRlNRMHRLK1RMbzRL?=
 =?utf-8?B?TU9EMSsvdnBqSjhWc2ppTU1udGU0QkZuSEJCdHVvZFF2Wk51L2EvSnAxbU52?=
 =?utf-8?B?QnpMZENlTW1ZN25aRGNEVEkvSWIzQzgzMWFLLzVQRzRIZGM5S2k1NSt5SDhl?=
 =?utf-8?B?cGcxQU95ZmVveXJTd3ViNHBRYjZDWGdVcVpReVFLREg3VWlVN3daUFNLbE4w?=
 =?utf-8?B?T293QjVWS1RxZDVUcnVRcG9qYUtiU0JKZitFelQ3SE53bzcyV0F1d3F5Ylc2?=
 =?utf-8?B?SUV1Z0NIRXB0SE15M00vZjBFcmhRUUp3NFlTSTVQSUtOVDB4dUlmdU1jdnl0?=
 =?utf-8?B?cWs2NzNFbEdqWDZlWmNudVVwWUYzZlFWUDF2Q25ETThoMi8wQmNMWUt5RmlI?=
 =?utf-8?B?RHRTWHRhck9MbEtZckxUTU45Tk4zNGxFZFJZcWJvVDl2akhnSE4zWmh0M2Vk?=
 =?utf-8?B?WVkwSUFCdm5jYytKUDJ3T1VFWHhlTjI4N01xL3BwTExjTTJvYzR3RklFTHNO?=
 =?utf-8?B?RDdjTVZJYUt3SDErQ3NyMjBpUjdsYURFZ1VUaXJJR3c3VG5aSVJieHhNa3dm?=
 =?utf-8?B?NXJETk05VHVEck10TGh4a0czbDBLZVI0VE9UbUJkQmJjSEp5YW9SZjUvMktH?=
 =?utf-8?B?MjVOekl2eXhlNUNaMzhmQzh3NGFKTGg5VFMvaFBvZzMxU2IrcEdlTGRUeGhi?=
 =?utf-8?B?Sk5qR2NCMFFkR1NaUWpLYVZKT1pLbUZFSFplOUxGUUxtVmpLTVpQRXFjQ29a?=
 =?utf-8?B?WnZlMXpMOWVRdmVZZ3B0RVk5dDMrQkI2R3FMSm9YLzBOYkE1U0FLMVFvUzQ3?=
 =?utf-8?B?bXVxamRJT2FFMFNtLzRDbU8rWVFzRit1Y0dZY24vNExzd2lQaXhaV0lUbUVY?=
 =?utf-8?B?cDdVTlN3a3N6UXhJVlJpQWY0VU11QUpIaEdHTnpHaHlNYWNlNzBXakNvYWxq?=
 =?utf-8?B?Vk96QUR3YlQrWkt4c2R2L0hNYkRsOHNXbVh5R2lTdmdUbXhQVm95eTV1VmZk?=
 =?utf-8?B?KzhCNHZYWWFvaWo5V3lUZ1l4WDhPZCtWRjlKWm5uU09lRDJCMUNkT1ZCbTF0?=
 =?utf-8?B?aXZza0orN2NrODVPUnpqd2JxdFYvMGZCQ2dMa1FFb052UTA2ZW1wMkZ6R1Fj?=
 =?utf-8?B?bzl5dGRTZEpVVWJkaHpsMHZGdXZrOTNDTTB1U0trWDg2SE5WUVNES09zRzUx?=
 =?utf-8?B?dGRKMXRZT2pnNlpCWlJpS0I2RnplM29tcXlmYnBnL1RyT3pLckh4TVp1MEor?=
 =?utf-8?B?S1MrNlFjMlYyRjBkcGtJWmNnR3NYd0dwODl4NnhhUFZSY0Ewd3JyNXp5WlI5?=
 =?utf-8?B?OGFhcUt2c1NqMVhDSi9TLzJWMFF4RkxGTlVzdE8vTzBTMW9Xek1qenc5U1I0?=
 =?utf-8?B?ckt3akhUSGpBZ3pNU0FtcWZ5YnVjWTllL1E4VUM4Q2dvRVNoUklXeURTb3FV?=
 =?utf-8?B?NXdDSTlzbFVHY1ZHdmFjM1M2eDdMeklreHFrMkpLcjArNDNjUklQeXhWU1dt?=
 =?utf-8?B?RFIzWkRpcmdRMUZFanVQYXJOcHZGbFBIZlVhWFdmN0lwbWZqR3BEcUJoWUt3?=
 =?utf-8?B?UlpsWjBJNllETk9vYTN6aXFPN3MyZDdDMSswTkluNHRQWUJXamRWUGNnOTJq?=
 =?utf-8?B?WTE4eEVYRGNrdkJMV0t5R3VNbUZnUmprbVdDaVF0VmJJTWtCOEQ3eko3VnI5?=
 =?utf-8?B?Z0NNWHNHaHlxWWtVRTlHbDNoblpPWUZ4OWZLTFNnVVkyZnJFSUl1LzhTeW9Q?=
 =?utf-8?B?M1Mwa05Dc014QkRtQnVUWWdJU3E1WE5oTm5QMUJIV3FyZ2g1Wi9Da0ZnbzRt?=
 =?utf-8?B?VGRrTUNPWXFyT1M3R1RBcW9qY3hlRWxXdVc3N1JtcWxGdURvQjJCa2dpWnFN?=
 =?utf-8?B?c0ZmZUUzR2xjMWQ3ZVlzZ0NLc2oxYlZmaEpxR3UvNkUvOTBndkVVN1J4S1B2?=
 =?utf-8?B?RU03blJIbGR1U3NKN1lrQmVoTjFXeXhXb1d2akZXVVhJdEM0STJjOWdYSkNN?=
 =?utf-8?B?bEMrODZPRm9QZlRqNC96L3FSQ0x0TmFtTGpuN1VNMlZOOE05VDZkNnZxT2F1?=
 =?utf-8?B?SGM1VWJYMGtLVmZzcG9sSHdhbjVFb280WFk4dnpSb2UvN3BNRnpZZE1rN1NZ?=
 =?utf-8?B?RnE4elM1RVFmY0E2VXNSUnNCS3ZqS0pWZUxwOEd1L1E1NmxjblRIV2YrTDN4?=
 =?utf-8?Q?FP+7g/dXWnCNBvZFFyN5Hlg=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f1d9cac5-0124-4352-5cf3-08da9a547830
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2022 15:34:41.1962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 tmarDiQYKzkbOu2qCC7oGzuJ1QBhzfud3/A3zfAFcVEY1coDdtAJEXzbbPy/2WzvadrwucfbT0J7VBnXsFYnFjn4J8GU4kibBGjt6AQeqcg9DEbzrCFZ5WQbP6gAqOpX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8552
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 19 Sep 2022 15:34:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3174

Hi Alex,

On 9/11/22 19:26, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>   documentation/dev-manual/common-tasks.rst | 54 +++++++++++++++++++++++
>   1 file changed, 54 insertions(+)
> 
> diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
> index 4d19bd921..6c2df9aa6 100644
> --- a/documentation/dev-manual/common-tasks.rst
> +++ b/documentation/dev-manual/common-tasks.rst
> @@ -858,6 +858,60 @@ enables the build system to locate the layer during the build.
>      During a build, the OpenEmbedded build system looks in the layers
>      from the top of the list down to the bottom in that order.
>   
> +Saving and restoring the layers setup
> +-------------------------------------
> +
> +Once you have a working build with the correct set of layers, it is beneficial
> +to capture the layer setup - what they are, which repositories they come from
> +and which SCM revisions they're at - into a configuration file, so that this
> +setup can be easily replicated later, perhaps on a different machine. Here's
> +how to do this:
> +
> +   $ bitbake-layers create-layers-setup /srv/work/alex/meta-alex/
> +   NOTE: Starting bitbake server...
> +   NOTE: Created /srv/work/alex/meta-alex/setup-layers.json
> +   NOTE: Created /srv/work/alex/meta-alex/setup-layers
> +
> +The tool needs a single argument which tells where to place the output, consisting
> +of a json formatted layer configuration, and a 'setup-layers' script that can use that configuration
> +to restore the layers in a different location, or on a different host machine. The argument
> +can point to a custom layer (which is then deemed a 'bootstrap' layer that needs to be
> +checked out first), or into a completely independent location.
> +
> +The replication of the layers is performed by running the setup-layer script provided
> +above:
> +
> +1. Clone the bootstrap layer or some other repository to obtain
> +the json config and the setup script that can use it.
> +
> +2. Run the script directly with no options:
> +(note: this will work to update an existing checkout as well)
> +

This breaks the expected sphinx syntax.

Please move the note after the code block and add re-indent the "code" 
blocks with three more spaces (otherwise it thinks it's part of the 
bullet point text instead of a code block instead the bullet point text).

Also, add a second colon after "options:" above to start the code block.

> +   alex@Zen2:/srv/work/alex/my-build$ meta-alex/setup-layers
> +   Note: not checking out source meta-alex, use --force-bootstraplayer-checkout to override.
> +
> +   Setting up source meta-intel, revision 15.0-hardknott-3.3-310-g0a96edae, branch master
> +   Running 'git init -q /srv/work/alex/my-build/meta-intel'
> +   Running 'git remote remove origin > /dev/null 2>&1; git remote add origin git://git.yoctoproject.org/meta-intel' in /srv/work/alex/my-build/meta-intel
> +   Running 'git fetch -q origin || true' in /srv/work/alex/my-build/meta-intel
> +   Running 'git checkout -q 0a96edae609a3f48befac36af82cf1eed6786b4a' in /srv/work/alex/my-build/meta-intel
> +
> +   Setting up source poky, revision 4.1_M1-372-g55483d28f2, branch akanavin/setup-layers
> +   Running 'git init -q /srv/work/alex/my-build/poky'
> +   Running 'git remote remove origin > /dev/null 2>&1; git remote add origin git://git.yoctoproject.org/poky' in /srv/work/alex/my-build/poky
> +   Running 'git fetch -q origin || true' in /srv/work/alex/my-build/poky
> +   Running 'git remote remove poky-contrib > /dev/null 2>&1; git remote add poky-contrib ssh://git@push.yoctoproject.org/poky-contrib' in /srv/work/alex/my-build/poky
> +   Running 'git fetch -q poky-contrib || true' in /srv/work/alex/my-build/poky
> +   Running 'git checkout -q 11db0390b02acac1324e0f827beb0e2e3d0d1d63' in /srv/work/alex/my-build/poky
> +

Add your note for existing checkout here.

> +.. note::
> +   The script is self-suffucient and requires only python3

s/self-suffucient/self-sufficient/

> +   and git on the host machne where it will run.
> +

s/machne/machine/

Replace "host machne where it will run" with "build machine"?

> +.. note::
> +   Both the 'create-layers-setup' and the 'setup-layers' provided several additional options
> +   that customize their behavior - you are welcome to study them via '--help' command line parameter.
> +

Replace single quotes by double-tick quotes to highlight.

Cheers,
Quentin

