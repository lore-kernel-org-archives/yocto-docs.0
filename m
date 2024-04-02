Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5F7ECD1284
	for <webhook@archiver.kernel.org>; Tue,  2 Apr 2024 10:00:09 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.108])
 by mx.groups.io with SMTP id smtpd.web10.8396.1712052007540400194
 for <docs@lists.yoctoproject.org>;
 Tue, 02 Apr 2024 03:00:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1 header.b=gBknxeOL;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.7.108, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PyCXKzp1JcSdQQSjV9dTMj5m7NiWkGFprQLTCdKzri5/bL5/Dbaekg5h8wEPb9acXps7qR/XXJj/dahVXh1myBMND/p32wsR62pzV1VGhq9fmHSgs4oNF/jJq8sM56bQ03VSHlpoPmDNzXkQ80rTItr1He8xWFPaf3zMCUPPFxAE5vGfS/fXK2zRksAKP4oTs3n2UVLEXnHHcaqSyCEvUVBZeqAOKVZn+Mmhnb6dqPpHcmKReP4V2rj0kVJmBZIWSf8W619RKXDIoI+yCrXbFQ7zuEg//6cx2myFfjzXPLx4Jr6K53mNcBecaEAbj9Yj2aDqha0mw19vVTOZ/ClQkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xE3edXS1XcQmLklPuHOqd/xs+S2DqJy0aAUQIUDnGU4=;
 b=QMGLYbpik+LXXl3cNYH+m/rTjviQKK2vQW0TulOBqSvSl9xvz2aAGv0+PTv0s4hq1lBnelaISE4koKQHrvT/nEt1La2qQ4j2goGTP7/N/rFajpGzaT31BRTTTTpbkTu/El9xlz/JUExPzIQPYs4XT0LUYylfLkGZ6x3Ho3GydH6h1u99JgnWI+N5ZPptTmg/2Vnome8NDKom0MQn9a0Kwf6XkYalAeGaejRNNOYW4aUNhgsUq+zQ0URh3AgTPlfjtBwaFj1VP2wBWFviY2C7rtcpKvLf1KVvewAMND6HgYSF3v4gN9mf6ilpGLpsRLcKl9sWZ0KTiBpWbDIATTsqUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xE3edXS1XcQmLklPuHOqd/xs+S2DqJy0aAUQIUDnGU4=;
 b=gBknxeOLEBX58/mYk+gpw4s7pju7y97IDnXCoT/jf4L6mnOqrETfUBjwJCgi6YUeFGZWbVySwADVllfaPWyM/XKKAfQa6fHY6LeOk8GbqstFJjfj44HdMN0SkaO93xYRAQiFsM4yekxSOPKlksDd4jpz44CLccyiVwfpCIhMaLV9XHCZqlX9YIjR7rr0SzJbDXI7zwBOAOw6EONEIjCeta/JUacBSLhQ0NSPaoHzneGymV5SOoyESr58EWdLJ1NlTtlwNO+ubIlRw9bs1PJI/zMSpQ5/lTMHuHCjYUgu6IH4+5OXrQT25Cw/AAW7thJvHK+hEkquDh7PNfCaKuEqJw==
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by AS8PR04MB8149.eurprd04.prod.outlook.com (2603:10a6:20b:3fd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Tue, 2 Apr
 2024 09:59:59 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::3e70:7029:faf2:7779]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::3e70:7029:faf2:7779%3]) with mapi id 15.20.7409.042; Tue, 2 Apr 2024
 09:59:59 +0000
Message-ID: <803f3abd-3c31-4b5f-a47a-63336f7bcd9c@theobroma-systems.com>
Date: Tue, 2 Apr 2024 11:59:57 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] manuals: add initial sphinx-lint support
To: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
References: <20240330163609.1735506-1-michael.opdenacker@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20240330163609.1735506-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0013.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::16) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|AS8PR04MB8149:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TjImmaqgHdc6FLEs/e2gCtox86aQqRyyhARM68UmfO2HF5TfKzqPFfuP36FDjpG32qcuDHnLOXvsvTVuDh1jhnfsPLcMKNJjISPyEh3s36ZeB4UfkUgjPQA9Xu6UtRmqAwUke2ptOrLyowyQDbIkUoVwaDcnQP8HBxhfkmjsZStetN7wsILzRIwgFoPsM5T7pqPs/awsuTUy0RoKGyMc4PZRz7DXJXbCo+WT8ePm+MEBaOViuzt1G3/Tlllls5TeQyBpqZTvPVpmx4kHGsrtUAzgQEvbsnI4/9pAKTNzeVNspid1yXMKV7xgSC9K0Gp7bFQUu67FadO++eyj467WSgbVmG3YBlUUDf3fhrZtybxZDlHTCHmeYJEn7ygE0vqcvgsf7ibBnSkf+2e09YfESZJpR1HxvJGjfsJgVM/QhKzxL/xmlFFbvLqcXEUrH5e8CH0UNcBfo7Hao/EPTeSCAIX0ne1wtkroXdFZ1B+ztLa2r6DkyQe0bHfUaDO7ICTc8Pf4Lh5xNI5GmBXoh1WK+pXFo5wdEGGD8/oUgfNKG3hJvR0GPT9P9cDfpgrhxapBTY9RZkjQqFlaLXoHmWwVxLbSuhAoeRN7eqUe/Ib7lM8Woa7CpCSUe9w2XvU04fd3fSYciaB2myBz3YJdgeSTBi0EqJIFnv7ruTXH1rGv+1c=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OXl4K29mQ0lBYUt5NUMrU3lPL056SFhtQkt0Q2IyMFMva2dBUHRKc2QrTlJy?=
 =?utf-8?B?WC96UzB2OTdjQ0VYSTdYb202eVdva0V5VEpiaDdFQmcrK0FvRStJMTlnWnBK?=
 =?utf-8?B?V0FxUVZjZXFJVGNETlVmT0JFTzFoaGNVSFdYdWVNM25hWmJkQllkcmtoUE5G?=
 =?utf-8?B?NXBvSXhFbnduNjdsOEUrQ0dMZWduZlBnSVNkTlZhb3NaNnVxalh4R3dvU2JH?=
 =?utf-8?B?QnBhU08rVXRoK0xhbm12MFhmeW9WYkwvSWNoT1p1ZTlCdEVuUmhkUmQ2NkpI?=
 =?utf-8?B?cXhSK1lBSmdMbUFIQ3BFQlhweUNmREszd2hxMnFsSDcwVER4M1JBYTJmcHQ1?=
 =?utf-8?B?c2hTR0kzK0lsTVBsYXVWU0pua3BIUjhCUFN3UnB5ajhWdXB0a05DQXBXcjNp?=
 =?utf-8?B?YWNBamcwenZpbFRjb2NpeDhlMGt2R0hxUnNkemN0ZjVpT3JpaTBJNkVrRU1X?=
 =?utf-8?B?dVMxUjN1QWdXTm5hN1BPMVdhTHIvR3BQZC9YbTFJVlQyZGNaRjRYb2l5TXZu?=
 =?utf-8?B?QUJTN2htSThIK1NMcDIxM1hWSzVhNGtGeVhlZWVQc2cwYlRibHRRQ05mZlIv?=
 =?utf-8?B?WVZOMjBPOWM1RlVKYUZ2REROeHZBM2RqTE9zTGN1cGxnczdibHczbUZYMFhw?=
 =?utf-8?B?bGMvWlhpdndBS1JBYUpnZDQ2SEZweGRaazk4aitoUjJyck5sSzNNS08zeTZM?=
 =?utf-8?B?b0tBZEJtelh3VlpXTE9uSFFweTFncld1d2lmYzhvSkU5UFFsamxwLzd1RXVH?=
 =?utf-8?B?RTdWUno4KzJYN01JNVRhb3ZyL1ZDOUErM1pmSjk2TjJVdGVSLzhEenF5dFQ0?=
 =?utf-8?B?SmdnT3U1SVR0RWMwcTVKUExEQmNaQU5HVkJKYlVJSjNtUFVxWWhNRVhsYUZL?=
 =?utf-8?B?YzBHTUY5eURhMkhXSU5TanhCSllFTVlsQ1VsT0JReTlHbXBubTFna2JKaUVq?=
 =?utf-8?B?cXdOTXc0WDA3L2ZwYWtLNHJTZ2dTeUh6OTNjWXhDVC9sb3NuTm5zK3FRdklk?=
 =?utf-8?B?OW1tOHJmMzNmbUNGc2FQZTlhMGJZYmdueE4reFo3dm9iaWpBU3I1eWVDZGRC?=
 =?utf-8?B?cG81aXFaeHZIczhNN1lxSUZpbDlhZjFKQVpiMXRlSERhSVFpT1Z2VXhUeHVQ?=
 =?utf-8?B?alRDaDRvZzFKeU5zaUt6SEtlUDFmSmR2a2lIelUxdnF2ZGFNTFo3UmxJYnA1?=
 =?utf-8?B?MXJoSkZhemsrVTBEbHZUZ0FRVDhoM2hpY3pvTFA0eStyQTl2V1Q2eHFpYmM5?=
 =?utf-8?B?ejdVR0lDOWJmSXRibXNQTU5OeVhwZmh6dDlhS2FkY3FjSnlPUVNIM25qMmpV?=
 =?utf-8?B?bFRSQ09yTU1PWnljRk52ZFErekRXZG9nSVZpNzgwRzZZY3M0Nmg1c2F0c3Fp?=
 =?utf-8?B?QThNSHJaWVVhbW5zRE1HYjU3NzFadEs0aDgrZW1kMkdvQUNWTVpMaE9QUHFS?=
 =?utf-8?B?b21BNzdGbGNsYUw4WElHc2wyT2RVbnBHT3ZEc3BpellzWmI0RnBKT2c2aitD?=
 =?utf-8?B?di9aVW83L2dTMmREeVVOWWlsanlBVjF6RHNGUUpBVG53elN3WGJianh4bWl5?=
 =?utf-8?B?UUNJRVRSd1NjeGh0cFBJUmVrRjFuM1AvMCtxMDdjTWxiT1JHNlB3MUlSNGd5?=
 =?utf-8?B?eU44MWNVZExWa1Q4VWdxT1FYTjQwbkpTMUdyRVdNUm5qZERlYklJTm1jck83?=
 =?utf-8?B?US9sckkzTUJxQWdHd1Y1dFJucVc3bzlpdXVKcFdtbzFMS21ZQVZNb3Q2OHpI?=
 =?utf-8?B?eWZiMjFCV1BwZGY2a1c2dG9xY1dYaXhLZVdZdjJrOWwrUVpKODY1cWpCUUxK?=
 =?utf-8?B?NnNJalFzVWk5UWptUmZFTkVjY0RPaURDanorSG1yWm00R1haVzJwdVpKMFpm?=
 =?utf-8?B?cTdYMzhWU2k4akRDcnNPdkFtdjAzWnRnd0FrZ3lSb01Mak1rS0YyMmk3d2dt?=
 =?utf-8?B?anRSTitmdnkxVk1YV1VwV1JpYTBjSm5GTXcvSDlPL1VJNWVJUE5BYjh0bHZB?=
 =?utf-8?B?R2pxSy9ESndibEFMczEvVjZpbjNHeTlINzB0aDRNZHJpbG8yQXVDQUczS1I2?=
 =?utf-8?B?SnI2d1BUdVp2aUFLWVZGVUN5d2NWZjVucis2MndyT3ZBeTZveFV2T0VtQ1JM?=
 =?utf-8?B?eFFYNFJZL2g3dzFmaWxkOWxPVWNFK3JyR1d2TklndVloclU2R0ZBRWFBN1Nr?=
 =?utf-8?Q?BnW5jWEXe1wXGh+DCn89Uig=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6782f585-7d57-40fa-3ad4-08dc52fba815
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2024 09:59:59.1472
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g5ey+QPpXPg0a+0oUk7RIUPoJUhQIcZ0PsyMKu/LVt+PJa6w0J/BYO+1D2h8iq0a6d/KHVnQk6qK1wttTDjEVl2/q4U+GxznaBsLer/z3tgS64dkooX5p4jKdrIFmEZ5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8149
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 02 Apr 2024 10:00:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5043

Hi Michael,

On 3/30/24 17:36, Michael Opdenacker via lists.yoctoproject.org wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> 
> Makes it possible to catch errors not reported by sphinx,
> such as idle spaces. After customization, this should be used
> to enforce our syntax conventions, such as two spaces after a "-"
> character to introduce a list item.
> 
> Just run "make sphinx-lint".
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>   documentation/Makefile |  3 +++
>   documentation/README   | 14 ++++++++++++++
>   2 files changed, 17 insertions(+)
> 
> diff --git a/documentation/Makefile b/documentation/Makefile
> index f3b775b3ec..cacb51c036 100644
> --- a/documentation/Makefile
> +++ b/documentation/Makefile
> @@ -53,6 +53,9 @@ stylecheck:
>   	vale sync
>   	vale $(VALEOPTS) $(VALEDOCS)
>   
> +sphinx-lint:
> +	sphinx-lint
> +

I would pass $(SOURCEDIR) as argument as well.

Cheers,
Quentin

