Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20C36D2B924
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 13:14:29 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.43])
 by mx.groups.io with SMTP id smtpd.web10.17746.1730812458311800092
 for <docs@lists.yoctoproject.org>;
 Tue, 05 Nov 2024 05:14:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=Om09p8LO;
 spf=pass (domain: cherry.de, ip: 52.101.69.43, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MF2pRG5QLfesrQzn4pr9maCJ2v/tf8hQUzv2miHxZbq3hpZALaXGW7fPekILWc9GFkoA/B/H47bigkTU/HSucjcEcUC27MOuIOxJBTKQzM7jthwpBfiJG84ajiJCc+6Fxi41zjZQbB+GiAsZ5nXEIbL94//mnyXocqaAzXWoVcKvpF0P3npp8RHX/rasDFNV9ff5kdCxoljZECpZqfA+ONKoRwUnafE9HwBeep5lOwgJKfx7Ca1S3a2kHLE6mvJCTGFXAl6UoKEZP/F0HKOkAJ/OYpvvd+zJ1KVHaobjbWq3O0gSeWFdfz99qj2nPZm8GpcFTzdPYkidTJr97bYjWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IeURi9j1QnoAOahrHjbLKyjhj/2YxlKRPgmdkwdG47Q=;
 b=tpVEBGq07H2zUWHbv4rGoH/bqLjD9JZ80N2vE7SJSeOdrRZVhTuZBS/C3uS/7nvI5gyVKZ6WXYIMwXrpszx3iY4m+egMVjXSLivodAZNbHtYbE82/Fyq5r2vHnAe3N+nldhH89pPS5E9F9jLsvH8DYDOGvG/UMiMmR8OLpxLP+gmUcxQOvBXlBGdoQEHJYGI/YtMjqnIF61ljT0nhWC/Z4s6G6tryO4e7A0je4aPFLRMPmrEGVMwLXtkQWiye0xTAPXOEWoTo4FaLFA7Ky5InuTqpOjr3X28y7milAmV7sb3gWDJ/EBPHaPDzLKGHu3tK4yzRBVlD4iFuh95kxtmWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IeURi9j1QnoAOahrHjbLKyjhj/2YxlKRPgmdkwdG47Q=;
 b=Om09p8LOovKu8maCx8uZ96d59Us5TKLkkdYhSgAVzAZxKpktGkGYlpmeGc9JwzC3DgN+DNDujiRlWCSK6lnLDEasoUsh3SfzGs7ZOap9Psqt80a2q5SkObRiJsgyuYNsczT3tBybWAAWanKLxJhARYi7ERmWGfNBgCiygQD6KVw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS8PR04MB8342.eurprd04.prod.outlook.com (2603:10a6:20b:3fe::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.31; Tue, 5 Nov
 2024 13:14:07 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8137.018; Tue, 5 Nov 2024
 13:14:07 +0000
Message-ID: <2a77885c-43ff-4574-bf1c-d35ed77935d5@cherry.de>
Date: Tue, 5 Nov 2024 14:14:06 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 0/2] Add bblock documentation
To: antonin.godard@bootlin.com, Julien Stephan <jstephan@baylibre.com>,
 docs@lists.yoctoproject.org
References: <20241104-add-bblock-documentation-v2-0-74a8a2cff0f8@baylibre.com>
 <D5E9RNX36GZW.10MSD4UHMX2LR@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <D5E9RNX36GZW.10MSD4UHMX2LR@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR4P281CA0264.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e8::18) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS8PR04MB8342:EE_
X-MS-Office365-Filtering-Correlation-Id: 982640e5-283d-4b4c-2401-08dcfd9bbab1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?3LEzeACOM8OXKE3k53pzxcO6ToKQInDJOZns0I5WVg1RvJVPZaDyvK0tLddd?=
 =?us-ascii?Q?qrs0714GAt9O8NI07VzWR3fnFNxzF2L6HcXosPLv1pVf+fBj1wgngNr9vvtO?=
 =?us-ascii?Q?CNpesEBJpz3G72snfP2x73idx7IFlw6jNyqON+sT5bbGE909v49sMoq0Ggse?=
 =?us-ascii?Q?EoG+7UXEbA+rI7nCQPKDYaszSa/jpKVipvz/pIiIogYPMwk9XvSInnvm7iix?=
 =?us-ascii?Q?BBkhPJYpeLcNYe0OsQT58fKavxogPYsbfLNncv/LgWad0mCaOFR5wNvLU+O8?=
 =?us-ascii?Q?YhZmnoObsoqXFdcACl6gmviu/76oXYgS5dhfrYbIcRWSvUe5xZllZh9My8n8?=
 =?us-ascii?Q?FqrrBn/o8yBluk7ALQeLQSz/KpMNux15HoPV824o5OV85ZCN1aRY1aHxunuQ?=
 =?us-ascii?Q?DyzTgPaJULhnLa+ADYAvJXSbOTVH2UpCf+O94PyqUnWpLaJ+dkEWkGaVIyNu?=
 =?us-ascii?Q?K7ka81OemO3hcbEQGIv0KxtyazEHNbdv4QIe4RrKEBTQkNl+ec/J29XPVVHE?=
 =?us-ascii?Q?5QQoV9o3ZEsrAbcP/1nfAjFgiVDkxLz2u/WVMmBAk1jucUZuhRuum7UbG2pL?=
 =?us-ascii?Q?d5RiQY+EEwXQiNRMAtzTluVUpbQq/bZqgrOtZAvt+yAkk06Ekpb5nM+TzCIv?=
 =?us-ascii?Q?E5t3q3MQWeUnsThG+H85/CZturTINsms6EpmeXwF//vz3M8gakEwU1/uX13U?=
 =?us-ascii?Q?y1dVjx7AJPTRQjXGKJ58MYAFgM1u7ctmD3ZvuA5tFHG9DikxFHZZZkvlMlvc?=
 =?us-ascii?Q?KaQvab4C8dfm5vE8ylEyW5Z7XCKwSmDNh56VlXveFlU4A1u1oSSXrJFFvv/g?=
 =?us-ascii?Q?w/NEaQDZQ2A/QlD15slQxAEO+a290v64V7jFfJr7RbvBxfTvdBJ+EUFVKhXZ?=
 =?us-ascii?Q?36REtRQ5W1Azp3IP5jHaW63EDaKqNHux7+xmjF0HHpj4z1qr/qgFEUB+72Zo?=
 =?us-ascii?Q?AZth97po/S/NhLrC8MPpT78P/oBgxE2mwdhrg7ini6hQ+B2pF7BJwsKE+sy1?=
 =?us-ascii?Q?mR5va6hdvAzlLVqTHWouZ6elf67N0747nuaabCvgAuOjNMervmO//jXZpdxo?=
 =?us-ascii?Q?gR6r67aSMZyefA9DEj2jDrwdXxiMrf9vNLJB4jsXAs8p3B4xIV001Pg6dppE?=
 =?us-ascii?Q?qtEW95/alIOMWLJOrWTLG4y9LiojBeZrj1ZwFjtIVCDY9OvNeGmSP80/O3sm?=
 =?us-ascii?Q?pHm8ZD0q1V+ywcJ+yq9IW+PJMkgAJ3F9wN5lHzmpSrVnzqVZXyG76vvO0a8h?=
 =?us-ascii?Q?LxZ3OcxIzwZ4mx1hPfBrbl6CQMnVU8Tw1mCUau5XBoSGRwGezO9h1ISEGQdL?=
 =?us-ascii?Q?n7V39+ZziCs3IWkjKHBOH1WF?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?I+uGk/CPmzyOFTaCRU8CNksr0prvHuvOFhNoa8aZfW9j8SEVMreSUyZ6kXe2?=
 =?us-ascii?Q?ipRu4i15fN+GAcREfX6c1Ja3rNY6szKwo09+Psu7dCvYelFFVth/Z+aGw7pk?=
 =?us-ascii?Q?VjcsbJEfxR+NNEZ0R2BNL+Pbp8M3GqfLqu/W3+3O60i3/fqPwx6TgCkXfWZl?=
 =?us-ascii?Q?qmxQ6jZeLAfir2+h4Q8CknSSDARr5eGpfJgO4AUc9+0GzUDOWGWWB5Uq6SJx?=
 =?us-ascii?Q?4DHfCUdeIXG2E83VVEoVZSd0P0vo9jGghMB6gI9J4WjsBoBCU31M5DNwEQJz?=
 =?us-ascii?Q?txId13sdgNMy1nYHbOofyYYJKw5xR9d2scPhkOOp321GDT4Fel+PF9f71RZa?=
 =?us-ascii?Q?U8XKT1JUUVqJ5iJf1+FgK6j4ZOyIWnzCvHtn4+txwL/eeOPUBJA2JL5tzmdb?=
 =?us-ascii?Q?UQu1i1ZovO2/1WLZKE/zISp0RrPzc2J+1XqoxZrnPdPlwXCuBLr93FwegGnc?=
 =?us-ascii?Q?wZhO3ItR8mQaEZtGpOmpSdnRUdXjyE95+lOukh8y93/fLtyRN3XdT1JE8GHM?=
 =?us-ascii?Q?t9zWONr8kstlDKmwRl9W7RXYm3wnevhb9Tng5l3M0Q4VdYI6XLCYl0k8KzUB?=
 =?us-ascii?Q?UUMRpqobXWAxUl7X2TGg99YHvd0lAxZeYIV03Sw1iaJwqD4CDEVd6vOp1OpB?=
 =?us-ascii?Q?vhcb5cPEZmQq8tnoqiNPYeeyLQapUcZGBVnSIxsclozKrlr2kH9d29ElmZxl?=
 =?us-ascii?Q?G64JsTPVIyQ6D1yfR9ISc666o4RQD9WgOMA9QMa07fdF/cD3Jg1Tzqydxl/B?=
 =?us-ascii?Q?T0oNnCy7PnVdhjz6o9fJLxJpNHHQQnw+zxwydXRCZfxyfKd3uAZA23rQIb4X?=
 =?us-ascii?Q?VbgfV/lqG2hvzkTvN918n3NonQBRsos74l73Epy7CJLw0rrc5IZ/Ynx6LHCx?=
 =?us-ascii?Q?UMhnC4TsTg69K3zvwxfU4rdj/4vpzAeauiAjHLM4cGLcJQpui/0EXv3JjW+j?=
 =?us-ascii?Q?yDjAvh7Tg4AePTzdF8RQGxvqTFuxGH8381/cgUQn9BAEO5XeutBvKjskjQqF?=
 =?us-ascii?Q?8Y7iTYVXRLnEOY2NI8eYGEKZC/Aa3yUZXZKPH9wV+bB0Ogx160r1XOe5PEdM?=
 =?us-ascii?Q?+yQJb8+MUTP/WklNBsN359zrUOz/wa2wqYxNL4FA231vpjBOjLhXpcH55LKy?=
 =?us-ascii?Q?1Ac65i4CqaWKtJJ+QwvGz0DYXYJTjpKJHpmR0g9ydppFUtO9eCmcaViyicED?=
 =?us-ascii?Q?8LEnyV62hwVLBNdgSkVAFxqXJDCIuDM8NU+/NVI5wFRsO9OJNEylAf0dJHk/?=
 =?us-ascii?Q?rflU8WOKh7+iCJarkY6bJp6WdmAteX/1WKaQ3MylmWceodt3EvL58ACBeIiy?=
 =?us-ascii?Q?uRVWr9ecqpG5V33Kd+wwCmIp1rHcNFco58XZzXu3JAoLsQKSVZzUmE52bXnd?=
 =?us-ascii?Q?RjZCCGgSTXjzwe+syRwdcmiLrzFvvw5OWbAbuask4dcnOIzKMAwax++mGBLZ?=
 =?us-ascii?Q?CO6L8FqH4UvBUKYiDuxdknWFVgM/zt4S5coelNaOlMb1HzUBfgTB4SNVZDaG?=
 =?us-ascii?Q?GPoPafnQ8yRYjDsBR/xJ1e5OXYjgRtN214q8g4XXSvCnUnxA6bJADDKgYMOF?=
 =?us-ascii?Q?khLQ4QOXo7fMPWsBfYNAF8gm2FVJDfVFXtoAJNoj2lfhcrw+/xs/AHbE/m7m?=
 =?us-ascii?Q?Rg=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 982640e5-283d-4b4c-2401-08dcfd9bbab1
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 13:14:07.5792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 25GzDWSkSFsg2Z+evduw0mFxMbm3Ci0IAnR4UmC4m7mTiaBTykaAFUffL8e6qmcW//1EVCEH0jFUQ6ylO/sQoV1DtLttpURyVNCXfUVL1eo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8342
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 05 Nov 2024 13:14:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5679

Hi Antonin,

On 11/5/24 2:12 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Hi Julien,
>=20
> On Mon Nov 4, 2024 at 4:59 PM CET, Julien Stephan wrote:
>> Hello,
>>
>> The main purpose of this series is to add some information for the user
>> the use VALE and SPHINXLINT on a subset of the documentation.
>>
>> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
>> ---
>> Changes in v2:
>> - Fixed various typos reported by Ulrich =C3=96lmann  and Antonin Godard
>> - Split series: bblock documetnation was sent into a separate series
>> - Link to v1: https://lore.kernel.org/r/20241031-add-bblock-documentatio=
n-v1-0-32b89093bbda@baylibre.com
>>
>> ---
>> Julien Stephan (2):
>>        README: add instruction to run Vale on a subset
>>        documentation: Makefile: add SPHINXLINTDOCS to specify subset to =
sphinx-lint
>>
>>   documentation/Makefile | 23 ++++++++++++-----------
>>   documentation/README   | 18 +++++++++++++++++-
>>   2 files changed, 29 insertions(+), 12 deletions(-)
>> ---
>> base-commit: 9563855ccd92e21fb6f8320c96a3a83e115c947e
>> change-id: 20241031-add-bblock-documentation-4a5f8cf9c6d2
>>
>> Best regards,
>=20
> Looks good, thanks, this will be useful!
>=20
> For the series:
>=20
> Reviewed-by: Antonin Godard <antonin.godard@bootlin.com>
> Tested-by: Antonin Godard <antonin.godard@bootlin.com>
>=20

There's a v3 already BTW, so maybe take/review that one instead?

Cheers,
Quentin

