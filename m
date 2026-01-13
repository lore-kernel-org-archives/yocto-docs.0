Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C326FD2D0FD
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 13:31:42 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.20])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.59047.1768311095123568761
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 05:31:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=S0EIzGTT;
 spf=pass (domain: cherry.de, ip: 52.101.69.20, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qmhW29Crzg0So8+xn9Hx9fK1GRXaRAyfJh80u3FQGkbXkAlcUmjEvyptAqeVOk116vsAf8qkbSKtSt09jAegcet7sHGbqK6OXJORH56pO+1qXgLp4qjqZ4VMJLvxm8I4vwjDdGxYZbKoDIjqRCXyrfdVEg9TO5BIn8DrcSfUSxdDBOcfnjAJen9tpEpzWBHEeWpiWlNF65MXxEILcy43v04Gm14ox8FXPsGV2XAq0Jc3G9PGbONEd8OI6r1HyCvxuNNrWMonGyjUvuMS7CSMW+BNfgpnEW7lk341NxETDuar9nxOZ5V28BMDgm0JU6SNRTxk5nLqWDyYbb4JDSs2ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zeQcLno7WyjyRzgzNelJyI7WVjuJIdvZlkM9GJt0YTo=;
 b=Z8nGDGlf6Ic7mQNyzswJTjsGL4Vq1PTyg9iQT4JzGtLmdKSRYAQQ2j7/XAqzaNIi/lgD/ZPFyEllVXV3+d0FkMxYhmpjaQnG6Vs34xEVL3o8Fwaq5J5C5evSPAe8c444JiyDm+wIVO4IYlBf1wR+Vkd7zgzwe+NiUa0ZtzquiPIYssJxvUPCps5JITUVGD13xT6U0yBCYnCe1tPEmHdQcx1X48cQNtyGRG7sxERP772UtOh72NJgWKtvuhQXGHS625R+5vQLQPMsaDopHz0aZpVJJfDhH2hokBgONbi8YT5ODV6X5901uq4CZVywtp9MH1Wi6qUSaY+QKkAh/6iaQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zeQcLno7WyjyRzgzNelJyI7WVjuJIdvZlkM9GJt0YTo=;
 b=S0EIzGTT0o1RR528rjWs3y/rb39mkCIIg2itiMSLQGbeUuYik93uH/5gQj/QEdRmhaJeboZ/sLBDgg8vFY+l0mv5m2XKw6xafy8EyoxBmKE4vV1cYfqxrFPC83Md6+W+D9s+W5aYPNjvpz3wsTfsjdh5v4w4wHJUgw2KLjyw8eg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.1; Tue, 13 Jan
 2026 13:31:31 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 13:31:31 +0000
Message-ID: <7aaf5f6a-2063-4f73-b5c5-fdbce9a5a717@cherry.de>
Date: Tue, 13 Jan 2026 14:31:28 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 21/53] overview-manual/concepts.rst: remove
 obsolete poky repo references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
 <20251224-remove-poky-references-v1-21-658a5f4dbde2@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251224-remove-poky-references-v1-21-658a5f4dbde2@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0235.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::20) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|PAXPR04MB8510:EE_
X-MS-Office365-Filtering-Correlation-Id: e04cd718-91e8-4b3a-cff9-08de52a80ff9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QnVGRXR6Q1pFc25xUEFoUmNRcm1WcGNrTU1iTFBQcVpTRm91Zm9GSzVHUHNz?=
 =?utf-8?B?N0lXNFdMVEg1M0x0NlZwa0U2LzUwMkVMQmszVnE0RU44eGJrOU90VFVlZ0Z0?=
 =?utf-8?B?QVM0eUxsSzVIMENVTys1VW9WK3pnTGJ3SjA0WDRTNmhFMkhLVUt0T0w1MUZR?=
 =?utf-8?B?YlRiRUpyWFY1cGl1WGVOYVg1Z2Q0K3dkUUxod3FXdlh5UEFXQVlLZXVWUTBE?=
 =?utf-8?B?SGtqcjVsYUhMN3pvRDNLek1FV1p5NkNwVU9FSFQ2Q1h2NllzN1EzaHhpb0F0?=
 =?utf-8?B?ZHdScHZTZHdvenl1R3VadE0rSURiSEwxZWVsYnNiVzNQdXJ6a0hySlVrakJQ?=
 =?utf-8?B?U3JNYlcyanN5WFFiVmRqRzJKdGp1MHN1R3ljL3MyM2l6TWRkem5OOUFpdGRS?=
 =?utf-8?B?dGRkbXVRdW8ydGlkNDhyUDFtZG5TTHBPdDJER0J6cXFBTnY1L3lweUdyZGQy?=
 =?utf-8?B?R2k4TGtSWm1EMERJMzNHdGV2bzBudFBCRUZudDh0cTlOQmpxbjFJVnNHR3pW?=
 =?utf-8?B?OTN0NlltWHRYVFBBN0hsNExTRGZ0M3hBTHlEVE5GRzdyaS9hcTZrUE9IcmRu?=
 =?utf-8?B?OERGaUs4YmpWVXZXcUVBS3ljTVNvTXUxL3E2eFVKY3JEcmlINkh3U3F2cXk1?=
 =?utf-8?B?aGFOdU9lUmE2R21sMlV4WG90b0RXV0tpS2ZuaVFPQ0JjcjdkUDczYnFyZWtN?=
 =?utf-8?B?cUkzelk0eVRadjkySzJKYWErNENPMVJzMis4Y3Exb013N3NXS1FNeGtYVHBW?=
 =?utf-8?B?eUZicmFoSmtyWmh2cjVVOUdNOUNwaGdWRkpmZXZnRi9yRG9qbFlRVWR4bE5K?=
 =?utf-8?B?NHRDUHNzVmtoVFFpZG1lSXE2K1hXTnJ6QlNNbGdZL2dNc2txZGEyVHo4R085?=
 =?utf-8?B?UDdNTW9rYnBoOVg0cmlUKzF3Wm54TmlwTWxUb3IzWWZjUTV6dlRTalNNbkpR?=
 =?utf-8?B?UHRjZzhBeDhjdjJIaFovWlRIejhJY3hhelFSTUJ1NGdCVllYWkc5b0FBT2li?=
 =?utf-8?B?SkZjUE4rTmlibHNmeUV0SmNITk9VNVJNeWVoaHVLMjFTY2tTeUhyVmtoU1Rj?=
 =?utf-8?B?a2F4ZjZjdEx1TzdJeVB5VndsbW1sWmRzMlh2NDdvQStBQ2Z5TjZUTzRnMmJ5?=
 =?utf-8?B?bG5nQUZQUFlnYmJjNnhhdktuSFJwS0Q1Vk1uV2dxMGhvdlc5WERpaTk0V2ZU?=
 =?utf-8?B?bXFUOUl4aFZBVGtjaUdqV05aMmlwOWJBS1JEUWpmZkhKc0xQbDQzNGU0N0Y4?=
 =?utf-8?B?YnhUZlJicjZnWkR5T0J6VnhIZTRlNmxFTXNLbmJuaUNGYXkwanhsNW41MW4w?=
 =?utf-8?B?Q1JPWXc3Um44ZnVHTXNxTVpINVE3N1RwZzNmNDgyYjJpTFFTMUpXU3gxbFBo?=
 =?utf-8?B?Y21qMXFBU1JHUnk5ZW1pbHRSdXdIUURiR3lzbzVSTHhWRTFYbmYwWjJUcG05?=
 =?utf-8?B?MUE4MXFuNG5uK0xxSE1QSFpxL2FhRDRGd2o5Sll5Y3NOaEhlRDU1VXlKYTdY?=
 =?utf-8?B?d1pDV05ZT2E3WlBFSE9LZ0F4RmFtQ2l0Sk5UemtEZzRwMFJHeGdUUFpSMEcr?=
 =?utf-8?B?SDFtRWE4RlpSSWEzakFIME9wdzlCSG1NNW9DTjJEMU9JYnVtY3p5M04zMk82?=
 =?utf-8?B?eW9WNWE2UlBMVnV0MVdpSlgrOWd0Ui9mYVhXaXdKNWVhclpITmh5MHduVUFW?=
 =?utf-8?B?cFRqaUk0Sk4vRkF5UDBSNGZqcTJyWWM0TUptL3RKdUhiTVBNbzhHWHVQVzJp?=
 =?utf-8?B?eW9DeWc4OU1mYk9lM01yQmNmNk9MY0RrN2pXK0NQYm5lWS9wVFp5eTI2WG9O?=
 =?utf-8?B?QW9jdm1TNmx0dG9EaTJ5VGQ4YzdvRGF5VEtPWGxUMWlxWHRaU0d2cmNLbERi?=
 =?utf-8?B?YW9leWl0RjlaR1BENFd2aFlRcUx3MVRJaXFSME00Y1NLdm0yU0owdEx0V2xm?=
 =?utf-8?Q?qJ9p8y2ceoEWATEp4NHA/M2IYa4VIiVL?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UEQxYmZ5bndjaXFKTkMwS3ZaZE5PaTNMZ04yYUZSTER2dEVNWm9GdzdleTNZ?=
 =?utf-8?B?VzB2K051OVVhZ3djWFJwMkd2N2dGNXlwRU9HWXdSVGhiWkoydnAydk96WlA0?=
 =?utf-8?B?TkRtUm5vS0pEZmlvQjlscnBWZ2JPM3lLejc4L0w3RjNwbmNEcC9jd3VXZTZV?=
 =?utf-8?B?aVRXRS9RWWtDMmxKVHJOSExzL0lWckhBQVZDVGh0eHZOK1gvODRXa25DZ012?=
 =?utf-8?B?R3Q3R2tCTjdXNXJya29jN2ZiZnpUNFZBdzVPZDhIY09XV0pnR2pkMExRUXVY?=
 =?utf-8?B?NXlCbGNsMmlMdldqcjhLWUZkOHp6SjhybFlDdmRxdTZFWFNHVG9ISXlKZDlw?=
 =?utf-8?B?RFpRMURtY0lKWjlYajF5R05ZS2hwUEhhVmRDM3dUVWdTN3dtekZlOWhPajdl?=
 =?utf-8?B?UXRqVVl3RDFOZjhpMThmamJTNExBY3J4Q2VuRGpOMisvU0xNTkQ0Q2MwRmhB?=
 =?utf-8?B?Rm9lV0ZxVUlzNXJUMlFweVp0S1dWeHY3NFNLRlA5NmtnY0x1c2oyVjNOcXhh?=
 =?utf-8?B?VVozR05PUWFyeXRzbDlDcG1INVRpcGo2Z3daUXV1MnFqZFZPaUluWUxXQjkw?=
 =?utf-8?B?MjlBbTNYOVJiZ2F6Q0xSMy9UYlVyejVqY3o1Wmp6ZkxweDI4U3VLeHdxR29r?=
 =?utf-8?B?bjJTK3l0bmlwRjJMbHozejl1bmdTMXI0WUNYa2xyY2VOMnlIRWxoSXNUWkVu?=
 =?utf-8?B?aU1GOU1wTlN1bTF2RTBJbktCZXlhODFEWUgra2d0Vjc1blJyWGR1dEdWaHZN?=
 =?utf-8?B?RFFkemxTdnNQRUpBb0ZBTUh6aWx6cUNCNXo3U2FtRWJQOGJPYlFORmVBTUpm?=
 =?utf-8?B?cVppWWtQTFhQd2dEdGhxdWVXQXZ4WThKWVQrbnc1SGo0d1UrM3dudjIycFRY?=
 =?utf-8?B?U0MxQi9MR242eXpXZ2xhSnVpN01PaERocWpXR1N5bWpuSGIrTkFIR2sxWUdV?=
 =?utf-8?B?N3BCdWpBUFNlRElOaEkvVDBnSGxscXN5Ykw0Z25qYkJjT3pGY0tRdHRXMUh6?=
 =?utf-8?B?ajlteFJ3MHVLNkZVMi9XWjMyeGJiQm53bmdWNnpRQjNVbXp4dlkzM0ZuRjJX?=
 =?utf-8?B?a0xFdW1ybVFpdFFTRWlHMmdDdEtNRTNHVjhSWHNlOW9CYmE4akEyRkdHMWNo?=
 =?utf-8?B?Q1NlYm5EY29hcndUTDZBRjhwem9rQUNBTHphT1hXNGxEcGE5TDJMWnZKdUpp?=
 =?utf-8?B?WXFFcGVBQmlEN0NIZnRZS0pndzZNSHJ5bEc5SmVyN1N6dzUxUGpnRW9jdWVh?=
 =?utf-8?B?QzZJam1tSEdKM2tZbGwrMWNLK3lUMldQUmJncXFJQllBR2QvOUhUNjhJclor?=
 =?utf-8?B?MURLeExVVFNSRHQvdVdMTGx1aHFkTHhraVNZMW1SR1ZlYjRJN1JRZi8yUnpZ?=
 =?utf-8?B?ZlhKNW8weWRCVlAyYjhiRG1iR1dENzV6SXJ4c1M1Um0vWU1LaU5Wa2pHVzda?=
 =?utf-8?B?bkRXUExqMEYyVktwUW45NStrazZvd2U3OXJTcmNaNVYrYm5JSkNKdnZRNmZz?=
 =?utf-8?B?NjhZKzE2YXVUaWp5Z2M4K29ISiszeTFNaHVJZnJoek1iQVl6VjdtMnZtRnNq?=
 =?utf-8?B?N0tsR2NMUWxGMHdubFhVVWF2VGJESEE2WDBId0xJbmlDWEJaWkFlcDBGSDky?=
 =?utf-8?B?MW5aanFCK2YyS3Qxb0hPQmpEOHI0YTNXSmtBdWxzSkFFcE95V25Qb3pFcmdD?=
 =?utf-8?B?eE8zUUNwdFdtdHpEM3U5MW1WQWEzeEM1eVlpVjRJMFRFcXExRG9pL2lsV0Mz?=
 =?utf-8?B?b3U3eVBMcnZIWWFKalhvd1IxMzg0K3JoWlNHVFV4c0RsSHdHajRsRVF4MjZr?=
 =?utf-8?B?dUpSdmI1L3MvY0FoSXhPWDU0dEt3TGxKTXZTZ2NiZjh5N3dzN0JhdnVnVnNH?=
 =?utf-8?B?eGtlTzdWQWNBVjJwVEd1SEFoeW1QUWRzRi9saVBqejlNZ2pXOHl5eE9LQ0J3?=
 =?utf-8?B?VmUvZllCWjFvemttQjhKMzZmMWUza0p6YzFid3AyZ3lwUitsajBzMjI3WFZG?=
 =?utf-8?B?YitJckRPaTl1aDhEQ1pCSktPRTdUUUQycXJVZFFGRmhlbWNOYnFxM3VYRGZ2?=
 =?utf-8?B?QmsxOUFBRGZIN244VXFwR2Z3TUZuWGRwUHcvQndmdlFOcDhQNXlxd3JxY2N6?=
 =?utf-8?B?ckV5cmtZc1kwOHBKZFpjWGdtMmtPZUZ4TjBEQ1RWQVFNZlJzaVZ0dU40d09G?=
 =?utf-8?B?K2JLNWZ6UzNtUGhwN2k1b1o1TGFFNStvL1hLVERIV210enQ5eXA2cXpqS1NV?=
 =?utf-8?B?VGwyUnhadkVhc2lmODc4bFpVT2d6YW5lejVDRi9UeU5WQytxVlBWS1MxR0ww?=
 =?utf-8?B?SC9RN2lCMDVuM3A4UEtZWjJ4WjNWK05IY28vZE9MTCtvY2Q5WjcrZz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: e04cd718-91e8-4b3a-cff9-08de52a80ff9
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 13:31:31.0030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vFcwuCv0bbvEyiGviSwyP7qiiejzcIulwx+kUmsadvpNyG6r1ocUip2ziL25u0D1VPxlvzpWUyrrQrbQG2lmIQYRGWz33jhWfoOk/J0CL1c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8510
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 13:31:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8510

Hi Antonin,

On 12/24/25 5:31 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Remove references to the Poky repository, replace by OpenEmbedded-Core.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/overview-manual/concepts.rst | 75 +++++++++---------------------
>   1 file changed, 21 insertions(+), 54 deletions(-)
> 
> diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
> index 04a08b7db..ec56031c4 100644
> --- a/documentation/overview-manual/concepts.rst
> +++ b/documentation/overview-manual/concepts.rst
> @@ -211,62 +211,29 @@ figure <overview-manual/concepts:openembedded build system concepts>`:
>   BitBake needs some basic configuration files in order to complete a
>   build. These files are ``*.conf`` files. The minimally necessary ones
>   reside as example files in the ``build/conf`` directory of the
> -:term:`Source Directory`. For simplicity,
> -this section refers to the Source Directory as the "Poky Directory."
> +:term:`Build Directory`.
>   
> -When you clone the :term:`Poky` Git repository
> -or you download and unpack a Yocto Project release, you can set up the
> -Source Directory to be named anything you want. For this discussion, the
> -cloned repository uses the default name ``poky``.
> +When you :ref:`initialize the build environment <dev-manual/start:Initializing
> +the Build Environment>`, you can set up the :term:`Source Directory` to be named
> +anything you want. For this discussion, the cloned repository uses the default
> +name ``work``.
>   

Why? As far as I could tell, we named it "project" in this patch series 
until now (or until the previous patch actually)?

> -.. note::
> -
> -   The Poky repository is primarily an aggregation of existing
> -   repositories. It is not a canonical upstream source.
> -
> -The ``meta-poky`` layer inside Poky contains a ``conf`` directory that
> -has example configuration files. These example files are used as a basis
> -for creating actual configuration files when you source
> -:ref:`structure-core-script`, which is the
> -build environment script.
> -
> -Sourcing the build environment script creates a :term:`Build Directory`
> +Setting up the build environment creates a :term:`Build Directory`
>   if one does not already exist. BitBake uses the :term:`Build Directory`
>   for all its work during builds. The Build Directory has a ``conf`` directory
>   that contains default versions of your ``local.conf`` and ``bblayers.conf``
> -configuration files. These default configuration files are created only
> -if versions do not already exist in the :term:`Build Directory` at the time you
> -source the build environment setup script.
> -
> -Because the Poky repository is fundamentally an aggregation of existing
> -repositories, some users might be familiar with running the
> -:ref:`structure-core-script` script in the context of separate
> -:term:`OpenEmbedded-Core (OE-Core)` and BitBake
> -repositories rather than a single Poky repository. This discussion
> -assumes the script is executed from within a cloned or unpacked version
> -of Poky.
> -
> -Depending on where the script is sourced, different sub-scripts are
> -called to set up the :term:`Build Directory` (Yocto or OpenEmbedded).
> -Specifically, the script ``scripts/oe-setup-builddir`` inside the poky
> -directory sets up the :term:`Build Directory` and seeds the directory (if
> -necessary) with configuration files appropriate for the Yocto Project
> -development environment.
> -
> -.. note::
> +configuration files. These default :term:`configuration files <Configuration
> +File>` are created only if versions do not already exist in the :term:`Build

s/versions/they/?

> +Directory` at the time you source the build environment setup script.
>   
> -   The
> -   ``scripts/oe-setup-builddir``
> -   script uses the
> -   ``$TEMPLATECONF``
> -   variable to determine which sample configuration files to locate.
> +:term:`Configuration files <Configuration File>` provide many basic variables
> +that define a build environment.  To see a list of possible variables to

s/see/show/ to avoid using "see" twice in the same sentence.

s/  / /

> +configure from :term:`configuration files <Configuration File>`, see the
> +:yocto_git:`local.conf.sample
> +</meta-yocto/tree/meta-poky/conf/templates/default/local.conf.sample>` in the
> +``meta-poky`` layer:
>   
> -The ``local.conf`` file provides many basic variables that define a
> -build environment. Here is a list of a few. To see the default
> -configurations in a ``local.conf`` file created by the build environment
> -script, see the
> -:yocto_git:`local.conf.sample </poky/tree/meta-poky/conf/templates/default/local.conf.sample>`
> -in the ``meta-poky`` layer:
> +Here is a list of a few:

s/a list of a few/a non-exhaustive list/ ?

Cheers,
Quentin

