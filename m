Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CB36CA0FF0
	for <webhook@archiver.kernel.org>; Mon,  1 Sep 2025 15:51:11 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.50])
 by mx.groups.io with SMTP id smtpd.web10.55620.1756741866150354304
 for <docs@lists.yoctoproject.org>;
 Mon, 01 Sep 2025 08:51:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=KaTe6pbG;
 spf=pass (domain: cherry.de, ip: 40.107.162.50, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gc0H4/DURaSm8u9Qjq5D1S+DAFWrQRhEIGxqW4b7tzQErpJXTScCF1XlxpBeuNxWn/1Ii4eOxD9V8tzhklHC7ZvMTWF/Y4l/zL2CW7v2dZnBdJIUPbzQ/uRmoppUGBAu4XxNaDi/XdsEioiDE3ahpzT1Fj99MK4OU1GsNFNK6RXmAyORUtoGRzSy22+CNm9bfv6LWiUPqlbXpLc1VmegyUElCM0kUMOvzG1mjF1o52fYF3jTBuWMUfgRkjKPgvpnAEyCQYrCVuVQwbAyGALtPDpdaAvPwE7HTAvcn9eGeZ6yu+gFBRVTmoKS5/8qEoPmQ6d2KY5y27ASc39rN0Fn+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XKqbHJ8torSuT7WpHNTD59OaYnbnFt67ejrW3tz1ZU4=;
 b=RoRaFWXgbziWtTFAM111dQ9E7bcVbv+DQ5VrYYan1Xl1ixoFB2DDny4ERs8LbE2N1tTqg2gugLzpUHA6QZOgagHyL8MGTwVaeTB6aUGeZGPdGlsm30883+nxxLozmu71jwUxNQew725i4VFO+YAAY9h+p9kc+oynLTb+iJpyGPEZxeJahJhVLsfk7jg1zyemby6IlzZ0cSTPkARHAiiUH1vV3qEy2UvrTMtvwbsR4t6RcKWRfLml+oKOToktaES+Aon+rXNFdMfCVh23JLhQUE5ifk2hFr5BvMpxEpWh/favztQvgbikexHV9Ve3dbwuHOGeIJgRoO8K9Qr4gwhD6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XKqbHJ8torSuT7WpHNTD59OaYnbnFt67ejrW3tz1ZU4=;
 b=KaTe6pbG2hXeM1jPXVZHS92eU4jOUXeyEBJgmnarQsdyWBlvIsPf3S3rZnEBMvQhccerlCHdratQ9JLqbO6hwQfhVdUxmDxzbv6niWWj2tG51/2JSufYnwREICowyoHHVHTeWg6p8JjhwEiLU1w2Cnvv0qbffrFCyUYAOO8Dh8c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VI2PR04MB11171.eurprd04.prod.outlook.com (2603:10a6:800:29a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.13; Mon, 1 Sep
 2025 15:51:00 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%5]) with mapi id 15.20.9094.015; Mon, 1 Sep 2025
 15:51:00 +0000
Message-ID: <506367ab-55ab-436d-9d1c-d57b40ed392c@cherry.de>
Date: Mon, 1 Sep 2025 17:50:59 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs][PATCH v2] ref-manual/variables.rst: expand
 IMAGE_OVERHEAD_FACTOR glossary entry
To: joaomarcos.costa@bootlin.com, docs@lists.yoctoproject.org
CC: thomas.petazzoni@bootlin.com
References: <20250901153549.552589-1-joaomarcos.costa@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250901153549.552589-1-joaomarcos.costa@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0208.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::16) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VI2PR04MB11171:EE_
X-MS-Office365-Filtering-Correlation-Id: 77f07d5e-17a0-4be6-9b6e-08dde96f591f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?w8tyI8rui+tDMH7pqqOlrDe9dM7Jeclz3ZLWzvZ5erGDt94YjXuO5MjTqIiM?=
 =?us-ascii?Q?JQ/Gkl9Rp9+3lJoE3K8ovjMCjkEmr5LkP7uHzzZynb81Q+3gUjN145TfgDdC?=
 =?us-ascii?Q?sNc2EboqKzhxj3gXuqomfA6zcH0TCwTS0WYHGXZCkMYltQqqsMpUa7xtjSbH?=
 =?us-ascii?Q?jNuOk3/xpUnhgCEwQ1kiuQXCTc0b8WC82tF4gcfwN2PY8UdGaT8fpwsuSNOl?=
 =?us-ascii?Q?yDaf4GHHGhRARi/txudTIZhL8nzGnPSwBEsJFC00gPFoLNi3cbOBNqgtUk6W?=
 =?us-ascii?Q?ZjPvq3S+/K8+CIvv11kfR/SleeCfyMsCUBareTQAQGbJBdE0XH2By2eCa898?=
 =?us-ascii?Q?p3qLl8GJMHvX4N9O+erznDErJmNDEHhy9Nu1TLBYDoO+iA1orfKwenY9b4WG?=
 =?us-ascii?Q?gwD9a/sRekFvFqB0bI7wYUc7SQQLhvbVoAN+okbyVb4qZhBs7JK7PUC4ePYb?=
 =?us-ascii?Q?TidDKlWcpmWGEKnZE5RPtfj5Wyw8y4ds59IUCJfJRi7uJWZhXeQXUCHnDR8i?=
 =?us-ascii?Q?KMphNMJntT0CQ9o5aQuy5nbBJA2zfsY5PShCnIu5w2FSxQrkVUzaLW1l4Qeu?=
 =?us-ascii?Q?u0h5DMumlb7NGNZ/byyZR6r3doEdcgly9vpUP0JWBe9VEzuM1xTzKDYANggq?=
 =?us-ascii?Q?4oUi57vbPcVvEW1maoZdy9beh17hFsisse7OKqFEw9MOF2ztp1hkCtmDJY3s?=
 =?us-ascii?Q?XNrhCtQD8OYWE4bWubhjXIrE37D/cPJhzGnncRPn7lwrjAQuIQIPj+x2LMbX?=
 =?us-ascii?Q?ZAPdopmNE+etaIUoMjFhhaksLvPibTRqkmS0Qm8eI6os/BKqh9zW8IHwJxxU?=
 =?us-ascii?Q?kDxzuwT6zjoUnIQT1zbg+L+1b9mOh0UNt7iOq+6wt+6MziQ8m54VP2H7bLEB?=
 =?us-ascii?Q?17+ao39PvXPRwbMjTWxARD9UMvverKOHP+3z73IDaw1oQV7U0kcH618Rayn9?=
 =?us-ascii?Q?5uo9d9Bha+YGV2Af2l5h4owTu/9RVhEKysdS2ZugPZ0IxZxB/l8gg3lotiPj?=
 =?us-ascii?Q?O9JK5T/TZqRUKFNlowKr2FZsS+qYGNckH7OEHHjtbJKIYd+yFNnB1ftXdsp2?=
 =?us-ascii?Q?gNoGw2paCcCr00s/fEKGKZETQwSEjdIV68d4/dFiFJfFrnXxqouXJ6gNt7Hk?=
 =?us-ascii?Q?SJUI1zpmsAOixAwuRjGj8wUs9+G4G0aoSmZ9YGQH/zIYOHZ/FwwMGXPao+/z?=
 =?us-ascii?Q?ne4o5SZufifIUTnCxsF75Ogtv/vxjwl+i2bMLA5kOXzpMvKLB0Ul8lhVvRTl?=
 =?us-ascii?Q?h0JI7bjEfccYHOoR7LQBFqH7RGf/jJH+wdtYvtgBLXrGhOs5qzr9udxObO5W?=
 =?us-ascii?Q?PfaZ8425QrDAZ4+IbGkUq2rvrFMhZHf+69Gl/I77kOLNnTQyQruEh0FUGhM+?=
 =?us-ascii?Q?dmoQcJc=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mFxZyEr2ZJcsAmjGBe47YujeJxVGelYm+Dx3444sSaE++SlzTQ6UxnLtTH+Q?=
 =?us-ascii?Q?io3+PyWrbJxIgZOib1x1uACCv5v4LKLG9EuChDWuQ4Qc7R7Ytcaq9tUTWp4Z?=
 =?us-ascii?Q?piJY7t4mDygAsn5zJtS6ezBIyEKPvrUZB2F5v+K0eL73tQ+5OdvsaaaIUmMM?=
 =?us-ascii?Q?KFw+mCq3YRY/U2JDdn9bHvkWSdg0tsx13UiK9Z9EGhshmdF+okjW6Puze4AW?=
 =?us-ascii?Q?1SfyCtgTUVJ+za97+3iZGwIvsNo8xcPvdoyhjQAOcVGnllUqWAI75t6YPy9d?=
 =?us-ascii?Q?n1XGPwro0PUriKJ1Rngf9LaU6v+m/iwvxFzGIBl8cheot/Mhmwn2+UGpo9be?=
 =?us-ascii?Q?asYzp7NWLDjUv8AMAcZXaWK85tXFChGjvFQQsvva4zgvnEpXhkpCUzZVS/ao?=
 =?us-ascii?Q?BI8JGpLrjgwedEMVWRUZDAuGL6d1CPi1VjjETwp7vygx1sUHeMX7ETcgglfk?=
 =?us-ascii?Q?rihMSaewUPAlTHrzATyP13Jm+bRrNEhPBLGiMUAAAIQmItjMiyZ0FoN2723Z?=
 =?us-ascii?Q?W64LJGI+OohqlgCmM+FvVU4yXPqTWeyAJXu66R3fpzJo6ZNG62dEU5bQSjUV?=
 =?us-ascii?Q?V9rtYsQwDDM1HVSlvwuF256IPm/2iatQzD3v8lRDTyBntPMU+esqjH5UwRym?=
 =?us-ascii?Q?y2mLdgJ/Xgu15271RQK26DFFQLhE+PKCrI9baL53Uwk9TRl7VtVyvIu4V2QW?=
 =?us-ascii?Q?/RkuBxhRLMFrM4dkZwrxrHo3B4ECSIwc99LCaY1vMoQMDV1svnAQ/EfrXTND?=
 =?us-ascii?Q?GIuG0KdD69yt4yfHiy5Jfr8gAFWb40iS2fG+7LwweYpe6lgq3IEgo4UdT0cm?=
 =?us-ascii?Q?eFG6Pl7jgKiEwvcMQCd1SD9PtuAhISP+1vL6IjOwiI8pWK1isCNvFt9Jag+V?=
 =?us-ascii?Q?4E1gNflzmlQlzp72SnIEDX8YmYrhkMzl7rlKSwv5YUqSMHQP9v4da3ft5akI?=
 =?us-ascii?Q?3YFGKn418lXGkMsQqN7qoci3QL4L8y35f64kQvDF4tgc6mQmNgIfPAFMQKD9?=
 =?us-ascii?Q?MvmgEoqigcxSKbRx5fleCTz5rNfFdWa5H4l3i5b7AroplQ2S0gdFh1vor5u4?=
 =?us-ascii?Q?PfjlF4b7zRuUwCTfwCY3v2NQDonPIao54QrtH5gw4514jaRea+2kW6LXCF+h?=
 =?us-ascii?Q?eHdO2ccASSVwOr/2GDOdeaZbGglixcKqyQGswwr5ZTOfwj9u5oyaLVtwfOIR?=
 =?us-ascii?Q?yL9PJgCSKCLw9LPmxQoUnW3ntrJWBt40acReUL/r84EuwX7DthDfwBtjc//k?=
 =?us-ascii?Q?VEUOkucgB9ptVhOvRzc7qkBOmXRg46XrP/r090BfduJuf+WYXEz3ODuXZsVT?=
 =?us-ascii?Q?uWOyATt7uL9LOLmZ7RcGLV42UEMyFinOX8ayiWpeop4ZZP+WnFD6bS8Una3C?=
 =?us-ascii?Q?l/EI/xzWCeqeqP7NVqngPrHschmjkY0M9U/1hwkpHc06P4CS+AC/Yz7lNM3g?=
 =?us-ascii?Q?Xr7Q2vlUGUXUmgKaTCrO6xhLECgVweF05Nxzajbua7P7j1r0F0ixAgyLhQ13?=
 =?us-ascii?Q?/RT2PrKB2ab37JvSBTAeqTV03/1qITsPZi+YUJhsOEA9d2kKCKZltYU9BkV/?=
 =?us-ascii?Q?EnkRUBNKO8ijQJIuMakgevcxH7qIZeZf3z6OIg/XKhdUt3kuyC5rrJWk68+F?=
 =?us-ascii?Q?TQ=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 77f07d5e-17a0-4be6-9b6e-08dde96f591f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 15:51:00.7997
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WSnhdm5O/q0RZykmUc+DynqY+51fZmF3tx1yEok0MNb4MVMGHAX/3pPoPRchWD7/WoO/sw384p35jfuNTZDqmdgQA0OkAyYY7RI8B/i/i9A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11171
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 01 Sep 2025 15:51:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7477

Hi Jo=C3=A3o,

On 9/1/25 5:35 PM, joaomarcos.costa@bootlin.com wrote:
> From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
>=20
> There's a (second) overhead factor applied in images generated with Wic,
> and this is already documented in the .wks reference. However, the
> IMAGE_OVERHEAD_FACTOR entry does not mention it, and by looking at the
> partition sizes (e.g. with parted) one may find it confusing that they
> don't match with the expected rootfs size (e.g. in a scenario where the
> extra space is "0" and IMAGE_OVERHEAD_FACTOR=3D"1.0").
>=20
> This second overhead is already documented, though:
> https://docs.yoctoproject.org/ref-manual/kickstart.html#command-part-or-p=
artition
>=20
> Mention the '--overhead-factor' option in the glossary entry and add a
> reference to the wks documentation.
>=20
> Signed-off-by: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
> ---
>   documentation/ref-manual/variables.rst | 5 +++++
>   1 file changed, 5 insertions(+)
>=20
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index d559899c6..b7fd1cc5e 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -4166,6 +4166,11 @@ system and gives an overview of their function and=
 contents.
>         added to the image by using the :term:`IMAGE_ROOTFS_EXTRA_SPACE`
>         variable.
>  =20
> +      When using Wic tool, beware that a second overhead factor is also =
applied.
> +      This overhead value is defined by the ``--overhead-factor`` option=
, which
> +      defaults to "1.3" when omitted. See the ":doc:`/ref-manual/kicksta=
rt`"
> +      (Command: part or partition) chapter for details.
> +

"""
See :ref:`ref-manual/kickstart:command: part or partition` chapter in=20
the OpenEmbedded Kickstart reference section.
"""

or even

"""
See :ref:`ref-manual/kickstart:command: part or partition` chapter in=20
:doc:`/ref-manual/kickstart`.
"""

if you prefer.

Otherwise, looks fine to me, so with that:

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

