Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43342C25B75
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 14:36:33 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.129])
 by mx.groups.io with SMTP id smtpd.web10.16130.1717684592203678942
 for <docs@lists.yoctoproject.org>;
 Thu, 06 Jun 2024 07:36:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=Qwl/wD6+;
 spf=pass (domain: cherry.de, ip: 40.107.22.129, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZfKF75VlqGhLfrMg5eCUZth4DSbYxb+POwv3yCYmw6WGDM+WCi3ciEhIankiXJLRsHyPjgcVTTLLIWt6nhp8pCUMoBFuciFzlgdW5gg/2pHKacRTAs5M7fxwlN0oq41vrwlu1tAfTinmcHihYDhQzxB+03L7J/g2b/eU5AxcMGhs0iF7IVpI92E+yjwSrx6xd2vnDFNWOeK9EpPqZ4iLLtvsTfXpo/DWkS3ZMF+xQWnjSYc/cQDPqSUyLgg25UhT7RfQLUMcYu8IXjFgE98x4mcukLaBzra7xoRdeVGYxiOwDYLaaxeItY9bWygAp+KhhSkXm0+DHXYfnb/0XzEgJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2qzq7VG9l+IywRuB8mmIq/O/g3YYk59dnjPvA6yMlQM=;
 b=URfFjkqGT8UKGIi6BtAVZXqcnC8E7a3FrSkNygSFLeNdta1H7f+eI0ZVm5mYBEQrn3AigQ6+xCoz8BM9oBXw/iakN+jTjGHAWQlTJbbcb3z0UUlRJHKA0HcLhyCzs2/BIRlQ7jktztVeySuMRi0HmBNNCSfEsZw632QNgRwokKGZKSuN/+rR8ubxjs3gowgEyzHScMVa23cHVaAVwn1hnLEyYksdblWpICvo79SmY3PVx/ZjIEFSC1BqpogiwEA/IS313yrsVDE04lnySOoLm4LcnMuRO+tejRnw6HGfHQ5nBXFQyu51FAIq1rmQ9qgKeDeIhRQ2BOm1Xg+eny2UHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2qzq7VG9l+IywRuB8mmIq/O/g3YYk59dnjPvA6yMlQM=;
 b=Qwl/wD6+vE2GZZVe+VCwDQodHJxBxBtQO6pBnMiecwDGs8TnvxPy4TcymHC8zTaTBX29iJaTevZfmq7sGfOptWZS6Kaidh2UYHh0ArEwisNFv9mLKsYiIU30EErkTWnoX387jKLrgx+TeAvIYGHSbquPdZxCGfPniYkltRbtsek=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA4PR04MB7982.eurprd04.prod.outlook.com (2603:10a6:102:c4::9)
 by PA1PR04MB10357.eurprd04.prod.outlook.com (2603:10a6:102:452::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.31; Thu, 6 Jun
 2024 14:36:27 +0000
Received: from PA4PR04MB7982.eurprd04.prod.outlook.com
 ([fe80::3c4:afd5:49ac:77af]) by PA4PR04MB7982.eurprd04.prod.outlook.com
 ([fe80::3c4:afd5:49ac:77af%4]) with mapi id 15.20.7633.033; Thu, 6 Jun 2024
 14:36:27 +0000
Message-ID: <bd22001c-8569-4db4-aa4c-953200689f51@cherry.de>
Date: Thu, 6 Jun 2024 16:36:25 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] dev-manual: Add info on build env initialization
To: jasper@fancydomain.eu, docs@lists.yoctoproject.org
CC: aoife.power@iris-sensing.com
References: <20240606135043.61974-1-jasper@fancydomain.eu>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20240606135043.61974-1-jasper@fancydomain.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: WA0P291CA0004.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::14) To PA4PR04MB7982.eurprd04.prod.outlook.com
 (2603:10a6:102:c4::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7982:EE_|PA1PR04MB10357:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f84dde5-92eb-4741-99c4-08dc86360c53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?/RKuJ41i0JGFbvLOAxbRFysOA0N7mr2n+pzbcrjSZaC2lEBPe3KpuTXVt1Nu?=
 =?us-ascii?Q?9X8LC+yjoEYOPDkrbxemX6Wsv1fNbtbvP+/EAFanUW6P/NDEARLdJ7a9H3oL?=
 =?us-ascii?Q?wGReh0mkIRVBEsC2pht1vHuJ66TqD7vutqxS7tEviuLiImrixVP7o9Yg2yYB?=
 =?us-ascii?Q?2QIqHGSz9utohB8FGvuOrr00j2JGYw0+rozSZuBgLsGpM72yDTBZW2hZbnht?=
 =?us-ascii?Q?RD0+q5vBB6HTmfB6ewxDTwbCjyhWnyUAqtP55r5+cYyLvv8q3LdKRKWBeM80?=
 =?us-ascii?Q?wOKGfHKmjh5z98FeXvX3zbVKfjytKMOU7YN26LdbPH44T1YoGCkNojdK/v6Z?=
 =?us-ascii?Q?4nHJv+e/bdQKK4b7kWkSwQcA21hcPFrlwMRnVzvg6J3F3uz7oX0pdhPk5WNJ?=
 =?us-ascii?Q?zqOJuX7ISKVfZqkHMMYEeqEhuKcD0A53BYc1IJihA6cO9d8p8KHBllbSqlVB?=
 =?us-ascii?Q?QkQ9r6h+Ij9Fe0bDbrduzDqRPf470z+uztBihAws2KWqv0tHfDXBag0ri1ll?=
 =?us-ascii?Q?GST/3YsOyV1UPKPyhVYjxMYhh01uXwlypuERxoc6h9LlSzaxWrkkZ63HRNYQ?=
 =?us-ascii?Q?Ab5hpTXGpWpqWVbNkVz3jnOFPKzxpIFj+n9hwJJW1bVrI9RurBgFQj6Ja5K6?=
 =?us-ascii?Q?pK+JJ0lmKy8HIh1Gbl9fZg0g3PHGOznFy+axQHR1kxoueXcQI92tCPVilrTO?=
 =?us-ascii?Q?hPmtYx6UisjKdMxFP6iYKdFdqJX6naL6xROFiyWPnb5NuQQlYaw1THo6ZgJi?=
 =?us-ascii?Q?1ltvQ6iOIehWEP784jAlXgfeXOKfDZvOKONHRXiysic0wIjr3hs6BrF0T1uD?=
 =?us-ascii?Q?TlIxbHEpGejejnrns7dMOeanxypk8s2KBgszl33zVFSGwg2L8kX20TIpM7qD?=
 =?us-ascii?Q?S7xmj0HN0p9+NHk8mg4I5KvqL/lkmfiBJE37BbksUx/6lT/hpamJ7+LsZJct?=
 =?us-ascii?Q?ymW6o3p++JS+VtUMncIIBroi3d58fE60rptU9g9TYcYC4nqzCSaFkK5DVgeM?=
 =?us-ascii?Q?gOlAcW19wxN3FjIC2s1MnPLa/Z+4FMd6RnuU5aljQsJkkloh5VRJJnE4B5bD?=
 =?us-ascii?Q?wIrZvDttTUj8WHqLBFNwI99G3wL2V+Uh9qSj9O/YCjr2prTrnqKPYrDAs7Ya?=
 =?us-ascii?Q?wyM4Ybo4CDpKSFhADLWsnh2bQKoSWfi8XqClxaDqSTTgWEoCq4d08bDYNlrS?=
 =?us-ascii?Q?6WhHxQEO8d9G/KMy2bk66FElmuaHLKvlnHoFbWq/a8J3sbQa6XxC9DyrI9Ki?=
 =?us-ascii?Q?skSGPZe1LCZ1Vk19PeCt?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7982.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GaJ1o3vLTNHreQoE1ZG6VDID18EAGbn39O9W+bva7VvIBylk1ZRRc+XiUtbX?=
 =?us-ascii?Q?boeAxYJE5aP0kTuKcsGHskD37VJDZU10Mh7dTrrnTNZ6WL8S8y/9/nMH6Cc9?=
 =?us-ascii?Q?eAFcBLZWJp8Z77OBUyKke80X4NVnRoNWOlQlX0bKY2EiNH/n5Z+S2RiLnwGo?=
 =?us-ascii?Q?bb6n+zh+4QNyHzUTcy1sebwGBVzBciEnRjuKftwdlO5aU4iiBhGeGiCN/jHh?=
 =?us-ascii?Q?Giz/e1sK0Lu7NwR2dmYa4ejbqKtmQaDCU3nHyaVq/vzYbC7W9VoYbdA3QSgT?=
 =?us-ascii?Q?lFEv/YgwDBnScQBixSCV200j185o3YhpEr9zcNzTISo/J2XF2vBJbH6Qvw2A?=
 =?us-ascii?Q?xYTr9oAXKjXd6KESSt2P6N9+NWQItot6A5Lh0kQq5sdBiVi+MQqpMJhgtx7k?=
 =?us-ascii?Q?s3MTE61W1cYqxHiNF+0RihzqT/3e5h6BCmFwNtr+zSLpcY/zOrIkg+U8ruRi?=
 =?us-ascii?Q?kF6nI+ERHmZCBdvRIgiRbuADv2qcD2Q2rNqgkUVGWrSuWhYQD1Hl5l4VgN0f?=
 =?us-ascii?Q?+raJV+EiGB+u4uxET5c+RYB7ixQetYdhx/vwgG5aSiSaTW9DzQUxppon/YhT?=
 =?us-ascii?Q?V18coYKrEmNEzj8qIAQiruFfRrgQBn01J8RkT/EDNTX3BVc6zvsUL+6kPR+v?=
 =?us-ascii?Q?/RjK6hRYFBRa2Sk3y6F8wT3u5NJH67rUMStRlrKnU+G+fOi0f5Jw4dMZHG9k?=
 =?us-ascii?Q?6SdwQNmbm5o76vGy4bdRMGKGsTVEhlSCUkhy9GtGmTi7Su305gBcKfl0Rywq?=
 =?us-ascii?Q?nyTp1fWyHmzCNxz82ntKoLMI8P10tMrivGTREGdqh68uIG6YO1Dy8s0q4O8V?=
 =?us-ascii?Q?0oneC5SRM0xnR7RsZfnIIewGj8KZup6R2yoDkm7SJa9f1J1Iwj7XGWQi5+9a?=
 =?us-ascii?Q?dJ/oSZeSP6/gKMgQT0lzatCHmRIOoUytk8k78IxfeMR+BWe0P2e6GgaF6mNe?=
 =?us-ascii?Q?rO+SY8S1AGa6Zenixu9dWSrutQidEwG7X5zWFvS7z6/cJHg3isKqncvUAHH/?=
 =?us-ascii?Q?NwoeO/j4cVrk65UfcTG8Zhj8+n6e257e+bu0vPfGby+xY9IewVfPL885uX7H?=
 =?us-ascii?Q?m0amU7UlDWTHcEpcnZI5m20LiwIZHOyo7/eeSIjGOFoettBJNaAeOuDIvyQt?=
 =?us-ascii?Q?p3W3W0PMaoK81GIIMMWU4G8r1yffl2vxfwANuzjuUqcbOKnrsQTj6DzYyWZm?=
 =?us-ascii?Q?eTrMcOH5FeI9OGK2zpcuI6/vHnnusjYP1x6sYRqd5jT1gCgfzQ6qPpba8S1U?=
 =?us-ascii?Q?F9f/PRvrRxHrtjwrpUgyBGKzI3had5Q6CYKGCAQfdP1eatVxAyr33eoNWp+g?=
 =?us-ascii?Q?rGk+3xyKT8OfsfjZ1V8V9+89BnmGCooMc1BNn9ZmJkYo2CJzpR1r6gzWKvv5?=
 =?us-ascii?Q?mO5f2NF1PSi6u95JK8ZutlK9UQMaW3Zlxin3BE+Y3K5uiCK6ZAWSF8E+17bQ?=
 =?us-ascii?Q?MVJcutgoE7ZiE09youzkg0unUXGgNXSUwb2T/bpI82iHlidqHzMWgeX8hBbq?=
 =?us-ascii?Q?1ku54BlXuYsW1NjhInkCyxWU/UmJ1zUdUUnFq7k2L048eWiwrrFNt6DaICA4?=
 =?us-ascii?Q?pllri4ouaNZVgX1dM00hvwhKmJJkrpNz35oaNySsRxWS+FEtRNIISaHYZlrh?=
 =?us-ascii?Q?halQJkeJIw469hU+IFCWq6U=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f84dde5-92eb-4741-99c4-08dc86360c53
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7982.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 14:36:27.4195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ASG3kmbjp+CDvHW2wEfi6PUWrt1ZdwwC59/g4AG+mIhVyyNoqm13MvrA0dc9Usb9vVAA3kBhWOq0dUwOqB0jkXNv3vMUUU1FW+Rp1qYrKOQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10357
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 06 Jun 2024 14:36:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5277

Hi Jasper,

On 6/6/24 3:50 PM, Jasper Orschulko via lists.yoctoproject.org wrote:
> [You don't often get email from jasper=3Dfancydomain.eu@lists.yoctoprojec=
t.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdenti=
fication ]
>=20
> From: Jasper Orschulko <jasper@fancydomain.eu>
>=20
> Going through the docs we a new trainee, we noticed that the build
> initialization is only mentioned in the quick build
> (https://docs.yoctoproject.org/brief-yoctoprojectqs/index.html) but not
> in the in-depth getting started documentation.
>=20
> While this is repeatedly mentioned later on, e.g. in the "building" secti=
on,
> you might easily end up somewhere where this has not been mentioned yet.
>=20
> E.g. in our case this was:
>=20
> https://docs.yoctoproject.org/dev-manual/layers.html# (which comes right
> after the "setup" chapter)
> ->
> https://docs.yoctoproject.org/dev-manual/layers.html#creating-a-general-l=
ayer-using-the-bitbake-layers-script
> (which is linked right at the top)
>=20
> To avoid any confusion I think it best to mention this required step
> directly in the "start" document.
>=20
> Signed-off-by: Jasper Orschulko <jasper@fancydomain.eu>
> ---
>   documentation/dev-manual/start.rst | 11 +++++++++++
>   1 file changed, 11 insertions(+)
>=20
> diff --git a/documentation/dev-manual/start.rst b/documentation/dev-manua=
l/start.rst
> index 386e5f5d2..cfc1be65e 100644
> --- a/documentation/dev-manual/start.rst
> +++ b/documentation/dev-manual/start.rst
> @@ -853,3 +853,14 @@ similar to checking out by branch name except you us=
e tag names.
>      ``checkout`` command are a snapshot of the "&DISTRO_NAME_NO_CAP;"
>      development branch at the point where Yocto Project &DISTRO; was
>      released.
> +
> +Initializing the Build Environment
> +----------------------------------
> +

I don't think this should be at this level of (sub)section.

Indeed we would have:

Setting up to use the yocto project
->Cloning and Checking Out Branches
-->Initializing the Build Environment

I think it rather should be:

Setting up to use the yocto project
->Cloning and Checking Out Branches
->Initializing the Build Environment

So use =3D underlines instead of -.

> +Before you can use Yocto you need to setup the build environment.
> +From within the poky directory, source the oe-init-build-env environment

Please tick quote poky as it isn't a English word. c.f.=20
https://git.yoctoproject.org/yocto-docs/tree/documentation/standards.md#n79

Additionally, please add a ref for oe-init-build-env, the same way we=20
did for the Quick Build page:

:ref:`ref-manual/structure:\`\`oe-init-build-env\`\``

Otherwise looks ok, wondering if we shouldn't link from quick build->use=20
git to clone poky+the first bullet point of Building Your image to the=20
sections in dev-manual->start. But nothing required for this patch,

> +setup script to define Yocto Project=E2=80=99s build environment on your=
 build host::
> +

Can you use a single quote here please: ' instead of the one in the=20
sentence above? This will facilitate grepping if we ever need to :)

Thanks!
Quentin

