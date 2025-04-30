Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0D78C369D9
	for <webhook@archiver.kernel.org>; Wed, 30 Apr 2025 10:21:49 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.63])
 by mx.groups.io with SMTP id smtpd.web10.13427.1746008509497813433
 for <docs@lists.yoctoproject.org>;
 Wed, 30 Apr 2025 03:21:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=mpKQGI+k;
 spf=pass (domain: cherry.de, ip: 40.107.249.63, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fdJJdO0f2/onJaAJCCTlJTST8zKWJ2AluJZyuWj40KHWq4hmee3ZnWmO3q3V2s4zY3KkEBCGETAtnvpy/O9G6mYH8L/ZNR9XbVerkrGHCTJ3TJtVfgmLarYW/5XeY/tPct6MBgT6jNnZro5kzN4+zJlhkvyRSjO0jcBU1SObDXdAQIaQjvelOJUj57Wzq58Y2ZlI2Ig+IYPwAsDJ5bgiTgEBpJZ9D9m3iGfSJ7aaTMZfTBcAUbWkKad+E0TRh+u1GLI2EGtTXsB1/rOjyUHF9YXiNyMydTOo87Pfe2zG5O+soStS+qNse7ipAe+IILMYKcuBHB5W1fagx+D/5/VQDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ErUqXZGLxUbE0coaqmpmMn7KViThpUai+iKaLtnQ2A=;
 b=rHr/14/+xhK8O5StrMDffXW0T2lhCp7wJM8yDIVmcXjdlrIPPari720BsPQyx/AE1v6a/GEO6AFpK8z2O4vIAE3iko7eF9Tbu5qmuU6/FKx9j9tHZzjGp9IQt+RxlgBpClWoXGsityd5S6WpB+mnzVUitmjjhlFEKUmnS3jX4ssc7H9EHSe9UP5OibwtJCNKK1oKJfyCP78y+3S+y1N+tYFLVzKl9CeofaF1gvUiR/SephwmShKffve+mluDFEWUFp9ccu0JgyTziLfTHQP2+Y9oMEqpeMB6/NOlM9s9qi0YfD4c3/SkKAs5N7N1gt08duAqwL1BkvgmYtwY7qIOmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ErUqXZGLxUbE0coaqmpmMn7KViThpUai+iKaLtnQ2A=;
 b=mpKQGI+k20vh/4MQvb7lLhwpsziUeO0e8Um3DiThpxsk++Z+pEi//2iXhH8C/Ry5P2VCWZuUQ/xEMb0qJmJFdH3QpKFccrSjrpcPAmPgbk6gJvweV7PqeA6rqT2NZYoBbt/i088/RSHV0m33ajAo2r7RPVzpyTuzwdFpk90mGXE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS8PR04MB7688.eurprd04.prod.outlook.com (2603:10a6:20b:29d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Wed, 30 Apr
 2025 10:21:46 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%5]) with mapi id 15.20.8699.019; Wed, 30 Apr 2025
 10:21:46 +0000
Message-ID: <18f2832f-e367-4e52-8884-2367ff8c65c3@cherry.de>
Date: Wed, 30 Apr 2025 12:21:45 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] ref-manual/variables.rst: update ROOT_HOME
 documentation
To: ejo@pengutronix.de, docs@lists.yoctoproject.org
CC: yocto@pengutronix.de
References: <20250429181255.2858778-1-ejo@pengutronix.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250429181255.2858778-1-ejo@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR4P281CA0058.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cc::8) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS8PR04MB7688:EE_
X-MS-Office365-Filtering-Correlation-Id: 68d95180-f678-4ca2-f40b-08dd87d0cf5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?JlTcfz9RdBq0+V7F/ORBcbbFbQX5CA2yqFJfKqwjUEcwRqaZSmmGZjcCvsx6?=
 =?us-ascii?Q?tjGafmgOA2n2ZlewVAf83b7u7LKumGNxepyIcdXUrM5FBOZq++JDsAKEGyOz?=
 =?us-ascii?Q?LMr9yu+Denf8Y1My8rLpxzmRTzx9mn5DPg3WuIriQaZudHJtwxOQSCmzjemu?=
 =?us-ascii?Q?kHUcxPWOYuzh404uvJfvcjuRvGLrLwaPhWXghCGw/iqghuVXUf8c1x014YHI?=
 =?us-ascii?Q?1MWQc2fdHI3MAO6jnQYOdmh8r7YyD2ROK8l81aXNnHAmT1vEWI8ozNUe15Gp?=
 =?us-ascii?Q?Lx/IZ/ZhXOQ+/p5nfGu/wZG9GqrypE/kwS4Kccmcjj+MNyVAzfxKuPeHb0fa?=
 =?us-ascii?Q?xnhKx6tlwqsveQIXsqCGxWE3BTtGxf52WTTVyy/tYQfiCqo7OXOSkU6q8iVc?=
 =?us-ascii?Q?TWp9w3JgaUa+hE1Ob2aGrq3AvmPn9j70nkhrZNlkCqeQkQel3ajxaFWErrgN?=
 =?us-ascii?Q?GGq+O3E6YUhGpzlcLCIKw0FPjJ0vSazAn5UD4F6SjLuuOrjnIbajDTJLz6sG?=
 =?us-ascii?Q?tMosQ0uE90kjQLZtyvAAIzZVOCh2QtRhk0+Ymn+XNbzqPbkFYBsIhNZEp9Gk?=
 =?us-ascii?Q?SzKwk7inhSmY47woGsI/X9OdCluekUeepVOCzaMtJDx2jvMrckX7GqZ8tWMt?=
 =?us-ascii?Q?uv8vqcovevj9jGxWohxJ1ikmggbXedTUOhiSKemAR/3ekCJmifpMbbc5mgXP?=
 =?us-ascii?Q?Wd5B7taFdS5d5j7CzyuFSReQPymDkmCsxc9VBSyr806Kj05ysCSf+/C8ZVcY?=
 =?us-ascii?Q?cCXsRAiIUsYTnS58JgbOP4Jh4mAgEuQ8IbZlnRK3u2IJA9Y2FC706+BG9dX4?=
 =?us-ascii?Q?RCY+XsA4nGaaP2ai7CxG9hlvwbTvM6gQKZECgADKnffICp9yHtYkWyhbHf3H?=
 =?us-ascii?Q?u8fTsGbDM3nMghwpcw9rEDu7tPNa/rc9zUBBmEmO5YmTpfLKILW+X50w0P+3?=
 =?us-ascii?Q?wUWn43RwBLlzi++SGa0MelL0im1nUb2gaKPCXqUm7fRC0o6UsVWcSmNNBK72?=
 =?us-ascii?Q?UIDJoaGaQ/Vu2ltNysxq0kPSUY9qILgfOYOV2vwpCUXLMYjXy7IXgoDGUiFL?=
 =?us-ascii?Q?skUzl4VzE7EVNfZOcHe6ZUdb13OxQArTox86jc0maNhUiIuhMEklpswAW1xH?=
 =?us-ascii?Q?ekndYV79whYiahy7xSLtRV55gofI4pCSehyuMUScpmzMKmWJLCkWlzm1aaYo?=
 =?us-ascii?Q?YKN+UzU1hAgaK2ZaHOQ4tdyFVVh7BNzW9EzrcWBWyyiGkofRE4WVvTKnfO7K?=
 =?us-ascii?Q?gE6rAaLlyB6rKHTBCux6qDKVz5rKQqb6XuXfA1E9tyYJ8hP11PkRuEWTSLnp?=
 =?us-ascii?Q?uPnKT142OOOOET7WlPLwOzWNVYt7Blcc2uOSpSDjCBZ0gWnAnE+bUL+7QNrd?=
 =?us-ascii?Q?ucn1RGy0D+OK1XJGg2rP/bNlnf9/BDklDjCvzYvzPqjTx2+yFYrxwN3NpOXG?=
 =?us-ascii?Q?Jg6ZBkKKNNM=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LIJp7tK67zfXiLiRZYCor0ifbxBCVDsCZgIVfnGJj1I5P91Y2VSCcD4vp9gf?=
 =?us-ascii?Q?gfS6DR861cf9iZ8KJNFmOATrur39OUV+YG2KC4GIrr0zDdkVjgDgP3SHnKUC?=
 =?us-ascii?Q?EBCMOT1RxAYb9vdFhcQMEbTNmsdpseSo89xCR9xGY+9o8nuu/GaHwc3VDAwW?=
 =?us-ascii?Q?YS7B/ijWP6s/MxmrzLwl2VgLMLoFcYcQdF/7Ff8lgI+wFP5XgwKGY0Plxa3A?=
 =?us-ascii?Q?3ulPvjhBXSTDB4+2I0Wbdip4FwcGuyvF8OzBkdwblaqvXBUWHRd5Gs3urtFw?=
 =?us-ascii?Q?m0BLvfmDVy+jUPs3Vtu5tF7yuT5pLqqAFioUybEiMrTpXwysweUkUrYQeIrG?=
 =?us-ascii?Q?rOnWzua86WZM6QtoS38dWk/IybNQInoKsfZn+eYxuYOqCHaccyvUIIMvzomo?=
 =?us-ascii?Q?hnK6kaRXKVLNDlKvtYUUBlXZtfZs6NXfKGHKDlAUngGvD8jWZVDr/BJVUlaq?=
 =?us-ascii?Q?zlBU9LXs6px2/o8toMj7sFp+rXk5uL5ejHIshtPHVec+ACTVWkNOiADVqJD5?=
 =?us-ascii?Q?y5AwKEihW151ano4+pASFn7Nm4Uc/g5eQotmB5b0iS2SWMvHxjNAfTjkJxgX?=
 =?us-ascii?Q?XH2O2UjdpHioAaQHFVoN4yquL4yZm7NzvZqcLxWqqnqQRh702LgABwqxiTtb?=
 =?us-ascii?Q?TDP5rrg44REkz276Go/ehl2S348gNlz0vftPg9maqKwgVsoRpXS9pcyKhZuS?=
 =?us-ascii?Q?Q97wm6EtjpToZd1YOL5Utthm7XfdSOA5ejTOXJBsVSkyhfz/uWrQnc86efKZ?=
 =?us-ascii?Q?c7EAoWgjpa1J7TNfVK/NYCrz0oEwvajqR7kCjC/0du1pa8vp6sY3qoKqoHro?=
 =?us-ascii?Q?LwQi6gUb1mtWwmQ+EORM8r627S8PnvSZpvJDz+DkJMm4dK0PuBmg1x7DDo8S?=
 =?us-ascii?Q?C/TM+zQ1NQhu1+a6L8QRlQ7wW7VRmrClwn6dIQiU/fmQMXVtru5eISo/PVTQ?=
 =?us-ascii?Q?G56LceFU9EKvIjh2/bjDTXncKygL1FIuH8E2IheJQ1plbBhWGiW6JBSOCFwW?=
 =?us-ascii?Q?jnfblE0g58Fre1FZuTy1aCVKkHHnf3UmYa3wQ5QfanUdHU+JB0PTTGE9zU+k?=
 =?us-ascii?Q?ACkA5iCLcdHjtco/ZoMjQa7XAPipv6UY3ORTDK08yw57rEkMnUACXV2kvrFb?=
 =?us-ascii?Q?WN4GgnQFlFCympbiBCfGUYvdlgBLb4Njxv+C67TWEhqs906WY7tJfy5PAgy7?=
 =?us-ascii?Q?OCdHExDUNj0YrQnHne7m6yywIXEt4dNJV8y4jDDS75FjOhl1XlMQ7i9wziis?=
 =?us-ascii?Q?fatLDBtBEsYWZvvqUA/90ZMxi2hWxThwa9UNcB6UMTiR8/pu5Xd6QFCJ5cRW?=
 =?us-ascii?Q?znsw+L563vIhADYxszzUVy0nifOZbZW/5d5JSVTj/UOa+ZSklcvy7xqEHnmQ?=
 =?us-ascii?Q?lfucMZ1luX9tlA1mO8lhnceD/gPj/JxfffagS1VUhCfcOmJR73BbtsgyIawE?=
 =?us-ascii?Q?TCK17JdfSPmikWDefGojEw//zeqOFyPhVUwW0+f0OlorriI0sTxkJN8YZk51?=
 =?us-ascii?Q?Po0Kzsjp7asDJzujiUD5UGDDC+U+e8rpPup5MRBPZ40nDbMZAmQ0JzxIhuv8?=
 =?us-ascii?Q?c+gcQj5vAMx/bYXarnsXhLAB/UA7NWhoEfUt7eSL2HRkF1Ii0KTSLfi6d1fK?=
 =?us-ascii?Q?dQ=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 68d95180-f678-4ca2-f40b-08dd87d0cf5c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 10:21:45.9639
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ummxHQODxVGNo7qlPzFzQdlMfGHWS9us13N8Gyms6IVLzQzKuVNMqAfJJQMNf0Jw4UD+jVdYKJc3OvdlMwDfElYSjCmkrjJRr43GYfUq+ls=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7688
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 30 Apr 2025 10:21:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6792

Hi Enrico,

On 4/29/25 8:12 PM, Enrico J=C3=B6rns via lists.yoctoproject.org wrote:
> * Since scarthgap [1], the default will be overridden when using
>    'systemd' as INIT_MANAGER. Reflect this in the documentation.
> * The distro configuration is probably the better place for
>    customization, thus at least mention this together with the
>    local.conf.
> * While at it, drop the probably redundant description on how to
>    override weak default variables.
>    The example on how to set "/root" is still given indirectly, anyway.
>=20
> [1] ebafe463 ("systemd: upgrade to 255.1")
>=20
> Signed-off-by: Enrico J=C3=B6rns <ejo@pengutronix.de>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

