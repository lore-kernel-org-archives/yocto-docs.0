Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14C2DC02199
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 16:09:06 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.73])
 by mx.groups.io with SMTP id smtpd.web11.45371.1738858136069805887
 for <docs@lists.yoctoproject.org>;
 Thu, 06 Feb 2025 08:08:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=HtYB6+Qy;
 spf=pass (domain: cherry.de, ip: 40.107.22.73, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KF4t+99RhBXwZ0HOojdN1Auku9z+p2wZtCQp+rLA61TImNxWxiIdRTdHFk6Wd5kXtsgfewL8wAuB3lv0jWhYOx+/ouOiX1iRqrDG2qF5I2cro9TrTY2uZnAh9zo7OGA8nq80O4tSF382YOrmu0Unit62CKshhHfthg9bHSGZBmilLYobOLKBcoADmPwtcL0FHutXMVhDJ4JsQgSko6rrdopKUpA+qrSoigjDe1s1D6Ki4Rzslqnrhps5FZgfucamUGxnUYrDnMKrSwRBtcirrovvXqYaxLSK4VR3fV6FSzd+gLYBdlC+VzU3zbEwDm6pDUccHdRYm7AvysFL4Fjr8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qPb9yLr0XzeWqTGvUQOC21beCYt/PougFRtcecdj13s=;
 b=AzL11MSasRKx2jmkEx9U0FVrxVJbmUv452Zn9rXjzLwqJaK7EXHDI7nlLe4VYlY52zQocqHtTWD2ApWTW5fnc7hFFesi+BorDMqnl3nHWC1Uaz+Vh5M2z6hVxvtqjwOfmQ7WF0rLKt1xzhWC7hBCMMgiOJyjB/fmQShLAZiQdbuSs2OpH9OP1Z9tndvxAmfQ0/OcivW+CuCUiyN81UKTOUA6DmzxH3tOb2Yw6XeEOMruDFOeTd/Ivw5Ly2jJWW2fmD80qAsm/IDUM+BUQBdU18YpwD1KzeIVHSWZXFIj9Kcnw2BUnaeK03WmLyURYStAc7RyX7MX9uxCl2xS4TB5Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qPb9yLr0XzeWqTGvUQOC21beCYt/PougFRtcecdj13s=;
 b=HtYB6+QyC0DdvBKWxtAYay7VMhqVlQl2Ix4yqD3H5IoO5ho/dTvQvYLDlM4QD6Ic51Hadv3MKccHJeqGp/ERzQJ/iJ3XLjfAmYAPhYe/zRDm3kSt0qJkEId1xacVZ6eXCUBd6aeDmfK9wqXu5kjLgtSDVm1hjnRmOZTrFQFIfzw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by GV1PR04MB10332.eurprd04.prod.outlook.com (2603:10a6:150:1ca::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.13; Thu, 6 Feb
 2025 16:08:50 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8398.021; Thu, 6 Feb 2025
 16:08:49 +0000
Message-ID: <6a34b601-8ddb-4101-9ae9-d0996202f79e@cherry.de>
Date: Thu, 6 Feb 2025 17:08:48 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 3/3] reproducible-builds: add a "How to" section
 with OEQA* variables
To: yoann.congal@smile.fr, docs@lists.yoctoproject.org
Cc: Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
References: <20250206131811.86935-1-yoann.congal@smile.fr>
 <20250206131811.86935-3-yoann.congal@smile.fr>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250206131811.86935-3-yoann.congal@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR04CA0122.eurprd04.prod.outlook.com
 (2603:10a6:803:f0::20) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|GV1PR04MB10332:EE_
X-MS-Office365-Filtering-Correlation-Id: 84b6d8d1-67b5-4b14-f32c-08dd46c88adf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|10070799003|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TDF1UklUV1VDQ3gyWEJhYUlsSjlqdER4TXRBWGpwb0Y0b3lPZ1JCMzF1QjBp?=
 =?utf-8?B?Q0FsMWh3TE9tUFU0LzJ3MlpWVkdMTldQRVBQN3ZRRzNpNUdZQVNOZTFUQXBV?=
 =?utf-8?B?aE8rU0hBL2FGR2NBQmgrbTdGYnd2NXNOT0pMUlBBdVJEa0xSeERnc2RoUEM3?=
 =?utf-8?B?aWNXZElmTGpBSHZuZ0FlSUNySkliZWhoQk9pTjJxaWVmWUdndUNYY1hENnRi?=
 =?utf-8?B?OUw1aWRIandvbS9DTTg4bUFXK0FSekl0bzRsUTJKRXZ0WmRKc3lyNWtUUVlK?=
 =?utf-8?B?VFkzcFdpNjRibmMwYXgzTkRHanZUYjBHZ1BFdUtKamhZTjloYlhkdXMvTVlO?=
 =?utf-8?B?Tnp2UUUwMWVyZ0Eyc3VycHJnK2RXMDhhWkh4L0x6SEw2am45dVZxZW54L0l6?=
 =?utf-8?B?aXVjWnh4WjYxTnphUjkrNW5YamY1YXhvRS9hb1oybTVBampUdWdNMzZGWWV4?=
 =?utf-8?B?M2pES3RVRDVKVVA3M2thTlFEV2pURjdOVk5hYWlnTzVleWEzQ1JPTk9kUlZ0?=
 =?utf-8?B?WWNreTh5L0Z4V09UMERjcFgxeXhBQXMwSzlVcUFXNGNwN3lPUm1lZEJiYWhM?=
 =?utf-8?B?dG1rYlF5eXZ1MHhvamltZkhGM3F6M0ZRQ1VGV3pWK0NrVFdPOXgrdTB1U3A3?=
 =?utf-8?B?Nk1uSWJqcklmazQ1SGRnWFA0d2tIbjQyeCswWWtPdUxxeUJmWWR3WXY2NkxR?=
 =?utf-8?B?aHB0VEcwd21tK3dTUlJMUkxjcU1RazZsN1dxZHdCSS9ReFVIOFhRenI2Lzgv?=
 =?utf-8?B?K3F4b0liTXFFYW8vRGRhbFNObElLMUVJckFjUjdST0lCWkNBQXdsQzdyU1dN?=
 =?utf-8?B?aTFVSGdkSGxzc1NKekpDTHpjMGdMTEtlMUtONzQ5L3JxSVZtZ05lSFFYRWx0?=
 =?utf-8?B?RUxxdS9Bdkt0MExDMURMR3E3MWtzSGJDcXUvOVRpUDdtWmZ4bVRYNjlnWnZu?=
 =?utf-8?B?UFZ3MmZTVHFBQmQvV1FLQlp4S3pHYUpFbkVBaGdvWU04REpESFl3NngyazZX?=
 =?utf-8?B?elJBSDB2akpxVUZYeVFiVEFFWHg0dzkvZnMxdW5SUTZwc0dXU0c1QXIzN2tL?=
 =?utf-8?B?NTMybDRldTRRZ1JIcWpHeEd5bmJTYVI2ZENTY2tuNXMvU05UempkeWorN1pT?=
 =?utf-8?B?dEMvTlRYUXc5Z2FVbnlJN2s2WEdSY1VZd0VHeUJVNGxITmdmZk4wYm82Zm1m?=
 =?utf-8?B?UXA5aGI0U2FuQWttSkQ3N3JLRkJEejQyVWpiSk1pdXRmRHR3WWF5SEJKSWU3?=
 =?utf-8?B?eE1YRlo5bVJlWWwwRDNIMWpGeU0zVnI1amw0alo2Z1N6VDJHZU9pUVdtMGk5?=
 =?utf-8?B?ekpMWStram5zT2dQNjgxbDc5WVpIU1NZemZxSmFGSUE1aXVJSzhQQmVoRG04?=
 =?utf-8?B?eDFUUGxTdHVMWlR4czZwL3R3Nm56UE95cnJBTDY0c2M5ZDE1Tk81UXBUUHQ1?=
 =?utf-8?B?ajZBeHl4TmZzV3Bmb2tXZVFNTEY5bG5uN3JER2lpYnBicldmTnNTT2FHQ0Nv?=
 =?utf-8?B?Y1IvRkZWM3c5TWROK1FPZHZVbHh1VjdJejN5aXdFdXpLdTBHcFFkSzRWeE9R?=
 =?utf-8?B?YlBxeEhmME5QOTkwTHNXbmdlNmkrMmZxQkYyWk9DTHpVamR4aUc2dmtCa0Z2?=
 =?utf-8?B?OGlia1lUNkZSaGJJY1RhdnpJNTJ5RnNsdjJsYmIxZlcvSU96SjFwbHVIZ1Ra?=
 =?utf-8?B?THZNTlV5TVVyRGYxckY0cmVkMnU2c3NuUUR0TzEvOGo3d01ObXB3Kzc5YnFQ?=
 =?utf-8?B?RkZKa2dybFJ1Rnkrak9uZWJvbEt2dUpSL3UxNWFvQnNjTk9VcUszM0pSMFlL?=
 =?utf-8?B?Zk5uOW9PNitDQmtRUXRpUVZwenBkZUp4U3d0dSt5bDJqa2lJd0EzNUVHT05Z?=
 =?utf-8?Q?ZE1fuuP+VxTEJ?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QmFBcUVSYk9ZWGN0MmpkUEMwdjZSV0FNNnBKUGVDTHh4NzB6L2dwWldyS2ZP?=
 =?utf-8?B?SXozdFk5R1J3OEtoNmdaaEw1d042N1dQTk9wck9ZQzNHaU5rTjkyV3hHbHZ3?=
 =?utf-8?B?S1ZLckNRckdQaXZXRFVqYkFJMVNTSUwxZG9OcDg0WUl2eDdNbTZKczllMzZQ?=
 =?utf-8?B?bTJSSUVqSUw2eGNkUkMzeVJhc1EyQU1hT2tBUXR3VXJpekFNUmk5TWw2WkZR?=
 =?utf-8?B?YzFjVnZkZTBWZXZ5blRqZVJiRjFtN3lROVB1OHFLMU45Y25JSTJxcXc0OUgv?=
 =?utf-8?B?MkE0VnZvU2Zmdm9kelA1bE9NYnVRWHdrSjRXTkxReEk4ek5yUkQyblJIOEEy?=
 =?utf-8?B?WUx2OXd0SjhWcjdYYmpVK0JLRDdSSnQ4TUJYWGtveWw3M3JFM1JlTkh0Ny9u?=
 =?utf-8?B?eUFjLzN6dEZUR3N5aW1TcWpBUGw1aW9naW9FcHFNamRtVXIxZThuVGdoc1dF?=
 =?utf-8?B?aDUzN1p3R0xmUE1RVUxSdzRBRjlDWkF2T2MvMGhxNDRYM1NZZFNsL2NFQlYz?=
 =?utf-8?B?Q0ZIZjJ3N0oraXRpdVhtamEreDJlSm1SbWhwbWRhRUZjUjVlQmJ0a0hFQ2I2?=
 =?utf-8?B?VDdOWUlTaVc4Ylplemo1TVFpVU1la0lFRU9tQnhiR0NXekZhWHgyK3lqdkxL?=
 =?utf-8?B?eVhQZGpvQUU4d2ZHbGhYckYwNExMOHRpNVJ5YnI4OWpDeWp2dGEwYnlLemxt?=
 =?utf-8?B?Q1ZPTVBMVEc1bkJtRmpmTTUxOVNGc3BwWVhmWmVKQlcwYStLSWpyMTN1RDJn?=
 =?utf-8?B?UVc0VkNTWlRkSGFJUmFOTldmN3dqSWpjb2FGMFRRMWIyNHlLbVAyZXZ0NzR5?=
 =?utf-8?B?OFd5MUptRlVtZW00Mzd3UmZMSjdRbHlrTkZxbWI2bzdyODlEUGd4bURudmdD?=
 =?utf-8?B?MC9TUll1U3hxWFEwYXV5WEdjTmV6enJNMDkxVHhZaWlXcG9FaHQ1Yi9GcGxQ?=
 =?utf-8?B?RGxzUGpnL2tGZ2VEUktxcGk2MjR5MWtyeldKc0J4T1FidjNaZDJDZ1Bqb0lm?=
 =?utf-8?B?QjdBeExPSjYzWHdiOVY2dlg0d3M0WHFHREhIT1o4eDgvblArRFZCdnlBMS9U?=
 =?utf-8?B?UVkyTGp1OFFiWjdlUld3MkhSWG9rSHFTN3liNVBDK0JZRm5PNjU1cW00cnJY?=
 =?utf-8?B?cVRRdDJHZUhoTkNCVDJYTTdLTHN5OXhPVXZjVnVZSWVlYVI3eVNHVEpZVS9O?=
 =?utf-8?B?cks0dEkrNXJQNytiMDl4WnV5VzJQOU16VkhqVno3UlJIdFUvMUNNUDRsQWVQ?=
 =?utf-8?B?cmk0Y2JmV0pQZmlSQnNETjd6NGd5KzhnT28vMkovVGlKM0lieTMxdkdmbis5?=
 =?utf-8?B?WFdMMWx6QS96VE55RXpROE1FNjNiNmhIWHJhUU5FTXpJa1RETjkrQnBKMVUx?=
 =?utf-8?B?R05sZ210Yk01a0Z1ZlY0bnFOVEpjRlp6Q1pNUXVEWXpKYVZVZ012K1NtK1Bq?=
 =?utf-8?B?bWtGeERJbnpyMWt6RHJ4akUwV2VzajNUR2JuY0NWQ2RXVFgzM1I2Wmg3SEdI?=
 =?utf-8?B?cnBES0M1TlEwS212TGZjUCtIY0l0MWtDZjhHU1orTTZVUUNIOHVrZFhxNU5i?=
 =?utf-8?B?Y3JLR3hzMTJJcndpaEpFWWtXTE5JSUQzdkFYdTdFMXAwSTVEY3BDSU1tWTQw?=
 =?utf-8?B?Z0ZjL2FzS2VKWjE5RjN4MUJlV3pCQXVZTDVSeW82L05JYmpOLzkwRXcxbW5w?=
 =?utf-8?B?VjcyQlBXa3pHTHNhcDdIVmlnSXp1VHd2V09SMWFyQTA0TmxZQmlxdzIvTm1U?=
 =?utf-8?B?UFhEK2oyOGpuYzdaSGcrVGlNbE5mVGJFMlNOaThqMzFZd1Y5c1lwRkZaNU9F?=
 =?utf-8?B?K2dXcE5mNm1Sbm5JNWF3Zld4UnErV1Vhc2UyOCtmRnJIVXBBclR0ZmdGbVpX?=
 =?utf-8?B?WHZQazZEVHNodEZORyttQmxlYzdvSjdZZTNXZks5UC85YSsyZTB6ZUduTk53?=
 =?utf-8?B?K0RlNCs4MUF6eWxxaGp3eEYxcU5qOUVKd3BUU1dwNXN5dXhnSEJIWHZhNWF3?=
 =?utf-8?B?eXBEZGJJVFppa3V4TlJQS1FPMHlZZklnSWpQMUluZjRRcDZPcERQZDVTbWph?=
 =?utf-8?B?UTRqMUduRlIvc3E0WGd4R1ZWUmJGOEMwbkpOajNPeHZINmtUMGVSYVE0SXIw?=
 =?utf-8?B?bm1La3NkYnB6bWVzYk5WV3h4RHExNFRZbk9IZEY5UUQyNzlIOWJOdkt3SGdj?=
 =?utf-8?Q?VcU++xNE9TStSTJ/wvMvO6I=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 84b6d8d1-67b5-4b14-f32c-08dd46c88adf
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 16:08:49.5929
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ytr7akaxr4FADA4Hm20JvbIYmBYqOTL2Wvj9iq6/MNvpd3Ne1U9KZfcv5HzQWHYFtXXSd5wg8+scoEijoTBcFqKcXdDX3NLLZws3Dh+WIds=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10332
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 06 Feb 2025 16:09:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6265

Hi Yoann,

On 2/6/25 2:18 PM, Yoann Congal via lists.yoctoproject.org wrote:
> From: Yoann Congal <yoann.congal@smile.fr>
> 
> Shows an example of the new variable OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS
> and still mention OEQA_REPRODUCIBLE_TEST_TARGET/SSTATE_TARGETS that were
> shown earlier.
> 
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> Reviewed-by: Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
> ---
>   .../test-manual/reproducible-builds.rst        | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/documentation/test-manual/reproducible-builds.rst b/documentation/test-manual/reproducible-builds.rst
> index b9f671d68..909ac5216 100644
> --- a/documentation/test-manual/reproducible-builds.rst
> +++ b/documentation/test-manual/reproducible-builds.rst
> @@ -145,3 +145,21 @@ set of recipes before the test, meaning they are excluded from reproducibility
>   testing. As a practical example, you could set ``sstate_targets`` to
>   ``core-image-sato``, then setting ``targets`` to ``core-image-sato-sdk`` would
>   run reproducibility tests only on the targets belonging only to ``core-image-sato-sdk``.
> +
> +Using OEQA_REPRODUCIBLE_TEST_* variables

I think it'd make sense here to tick-quote OEQA_REPRODUCIBLE_TEST_*?

> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +If you want to test the reproducibility of a set of recipe, you can define

s/recipe/recipes/

> +:term:`OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS`, in your local.conf::
> +
> +    OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS = "my-recipe"
> +

We align by three whitespaces, and I think it's four here if my eyes 
don't fail me?

> +This will test the reproducibility of ``my-recipe`` but will use the
> +:ref:`Shared State <overview-manual/concepts:Shared State>` for most its
> +dependencies.
> +
> +You can have finer control on the test with:
> +
> +- :term:`OEQA_REPRODUCIBLE_TEST_TARGET`: lists recipes to be built,

Reading this I'm wondering if this includes the recipes that will be 
built using sstate-cache as well, i.e. all recipes that will be built?

Cheers,
Quentin

