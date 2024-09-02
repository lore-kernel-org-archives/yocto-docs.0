Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A77DCCA0ED3
	for <webhook@archiver.kernel.org>; Mon,  2 Sep 2024 08:42:47 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.67.44])
 by mx.groups.io with SMTP id smtpd.web10.34287.1725266566538327288
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Sep 2024 01:42:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=JdaDhsgb;
 spf=pass (domain: cherry.de, ip: 52.101.67.44, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S/z6yPfKo9/pq7zd3Y2kLkl7xPN/i+PefBB6AVg8EzDWhzj8mM8GkOaWbbjtPrc1hPAciVlfLE+gGlpbNRfZqbkD7T/0Zxzqk50mlWGrj3fheY7l6LQwhCzNt4ObEkeUOIPFoqceKYcbrpy4Pv7G/OWcIwk+nVCfAgw/kLgK0RHtDrWcseTd+HnUwWpqTf+u8IDKjwat7qZbMkVHfCovfXCBLWJriD1HZCYXtsROwVL1Ed8+/undX+luqUyrKWwUktp87aF1XpAlbcru/x8y6iK0sKlQVT6ZQv1s+0jA8iYsQHdEIQkZVwbng8lp2GJN0iQOIZRzefTUHA86u4eJYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6sQV+JUPLU98jQjErmx4SSA986OfWePQRY9tpJkjQmk=;
 b=rP/WVqhW1Ii2nBqj2hRctq3SMzdYsQ1lDqttGoYNfwxzounYoQMTzIN/eBboRZ0n0mfq4SngbhkVIT3xMNb2v7P7Zh4S6azyWjd5PUbaWhy+kwf/XLFJitzeULNeuxI0FCmLud6nanuicyHMlQJFgBgMFJf6/cjpY1m8TZgD/RNWwodPhyAb5EFBXCCJGwYNPmgQxbO6GialyBhJRIaDnHJf7q6Pw0shK69x7n6KAu5fzGmHWou8ABcGi4A3JNG4Cx6XIzJwTM10Ktn6+KNMlG5t1fBskDEi8MVqPd7pw0kDakQvgk2nbGAWrefUr2MBp3eSXPsHB0S9Ah8q3pMieA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6sQV+JUPLU98jQjErmx4SSA986OfWePQRY9tpJkjQmk=;
 b=JdaDhsgbX0eGX6Te01GnkwnkX3JV9waHviUFNJGBwPe09yTme9c7GwYJU07z8UI0QuEHkZCC/yyOI+HFUTFe0JnDU3oKSk2ZIUCfveVSEfHUiOBi6L9lWdOyY2xK66ofdjo/GUwFANtj5IfhjMCEJnC1vCBClUTPLmsqB3uyMko=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PAXPR04MB8256.eurprd04.prod.outlook.com (2603:10a6:102:1c6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.23; Mon, 2 Sep
 2024 08:42:43 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%5]) with mapi id 15.20.7918.024; Mon, 2 Sep 2024
 08:42:43 +0000
Message-ID: <97f6df0d-8f41-462f-924b-5de4626eb26e@cherry.de>
Date: Mon, 2 Sep 2024 10:42:41 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] doc/features: describe distribution feature pni-name
To: =?UTF-8?Q?J=C3=B6rg_Sommer?= <joerg.sommer@navimatix.de>,
 docs@lists.yoctoproject.org
References: <9288e40f901792887ac98417ae8c89fcc2f23a0d.1725018000.git.joerg.sommer@navimatix.de>
 <9275d1ee169aa794c789fd46d2e1f8f68befe281.1725088479.git.joerg.sommer@navimatix.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <9275d1ee169aa794c789fd46d2e1f8f68befe281.1725088479.git.joerg.sommer@navimatix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0341.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7d::18) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PAXPR04MB8256:EE_
X-MS-Office365-Filtering-Correlation-Id: 72a6c41f-d986-4890-ae2c-08dccb2b35cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?5azKRqisO9g2VmK50yGF3WG5HoGj+7yH8vJPpwzVnzqHWo5Q64RMvhpCToaG?=
 =?us-ascii?Q?6OzWqMYOeenA4U9I+YZTFOaDhBUNhfgPTZo9h8Trzxr+GOhCftQtQbeBP6Kz?=
 =?us-ascii?Q?alOkVVfimaMiBIo1eVnJ17vYFIzR8pFyTty04uqE761zQNp6wW63UeSCc4a9?=
 =?us-ascii?Q?HsMIfsPE5AtYJz3fxzi3VDFInn2LtMsRkMAZMPnRAa4EMH9ml8UE/fRPdpei?=
 =?us-ascii?Q?PUkqLd192DiIu4I0/MzlPdF7tPQx6OFH14RIoBaYlUUXdtMqGcY7iCfhXRhr?=
 =?us-ascii?Q?cV5/2Ah3df1K0XY0/BaYyoKo3edI9gutDSreHg3ZlC69vtTL5F1WvF5JnCPE?=
 =?us-ascii?Q?EtdV1Jv9dZkYrgvx3hwe+mlnwo5BWPB6yF1sNIk0b2cej+oIM0t7dhds5Dw5?=
 =?us-ascii?Q?6KHOy1F5LZn0X5s6Zv6HM2KcZuziYJTgUnjyHRLeWeUdDvMU7v0edrxTecXN?=
 =?us-ascii?Q?eMb1FaIMx/KatsAJnB91cCZq95kuNt0WUk9uicIpiVJS1DwHjh1kB5c2B00O?=
 =?us-ascii?Q?uMgvYfwpxn3bsm0lD1HC3KxH+uIREhMsCeMHco9sUPGLoQm7KJGQ0SyXbmEZ?=
 =?us-ascii?Q?JOg5/x79EZGc4Rz33bZNKP1QxHRIrG0rcvCsQyyFnNw6t1tNoRLTZVgEmp0M?=
 =?us-ascii?Q?cWdf78pLBVRXjZ1Zdqcb7ei0RHXmov+5iyAdU5+QXM/TwC+IP5vzH9bdg5QZ?=
 =?us-ascii?Q?OS6gBXAgtYribFrHto9SMAQxCXP+5oEXc6VxzXybaiDrcbeuENWM/9xaldVF?=
 =?us-ascii?Q?7fkhr87MqMMJG2Tgt8cTQ+z1Cc49FSEHjkohZ5p94nyJ80xViFNrsh6jLiJv?=
 =?us-ascii?Q?cDNaQ+zT/Y3+65M508ASAKboH1igjRmjBwszn4kgvW4YzBy+EnPHaNhk6BYb?=
 =?us-ascii?Q?s4/COu4CCReANvqE8yjHTtYmZ3aC029XC3+YVacBrCMZabO7N1tQy/F/ZxvX?=
 =?us-ascii?Q?9TETf9pjBoOb3m10R5PqiZb/4OFQg4jPfc5meZxRIRVWDp74cdv1jVRfGFdf?=
 =?us-ascii?Q?11jY3pQ47uL8wl9eFvBh//5AIANCN4iQ0gPlMLWLnlHL7mR2JIuIac4QO/yX?=
 =?us-ascii?Q?JD5yGKghPWE9IEqu4ilERek3oh7ly+C+W5McJ5sYl1/Rhs2OxQDQZFqI16dm?=
 =?us-ascii?Q?pbSXOgtSZBIRJQsggesrGh+9g1686TXwCJatJASLmE6+1S0aIJ37PpD1ijVI?=
 =?us-ascii?Q?vHTibqmnV9mBDsZuetO96x0Pox8SZcSbYVXVnAXvEjuAL9OZR/i4VrCzvmyv?=
 =?us-ascii?Q?u+Csj8ysnRPfkaP/d9zVbquCTwT70Rb+zi89p/Gx6+JHFuLAoNcpIslI34A8?=
 =?us-ascii?Q?1dxgp9Z8N8733Ov9zlCYotlQRAfc5FzWdXtCcaOck8io+Q=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1pHkpnrVS6oVEyv8pumEhT/dOTIVB+NfNh+AXDAaxOzj14ymJH9sIfx5U0Nn?=
 =?us-ascii?Q?557Lxq9Zr5IoRrxYmGOCyWMjXfBYeUi6FKvj/RLQvD3eZBCVhjpU8U1N+Ocx?=
 =?us-ascii?Q?JQfC1m37nLCM7c06WP3Q92wRknJqW1toJwxMhRz2f+LzIYo8EmHWZhvjj+Oy?=
 =?us-ascii?Q?DUhye3egmoyR5VKs5iijZkKP650gUPUsMcYecuARFhEqSWnLTHABq0RyJIBC?=
 =?us-ascii?Q?DtTAAa0WBAB7uUnOlORoq0CwOvMuBDecnwfFOh/LiqfcXprimZG+SWq4Xb85?=
 =?us-ascii?Q?RBwEj3THQOPQVqgIjStN/x3Vq3Lq7r2uzYHeqyRUq04gNUEVNIr0iRngpgVI?=
 =?us-ascii?Q?qs/KE23FrY42PfW5velZMo6pqQoGIBDFyP1fj4IiM/fHd57QU8DQ/CAcDodb?=
 =?us-ascii?Q?tQbmjCdq59GpXFc6If6Uprv21ay1xrlgtdvCKQEqR767iWMhxXHGa0U4KFSF?=
 =?us-ascii?Q?dZssbLSY3buxpArKG3BTGBdYaCpgtvNwRomW+hJPDcyF7q4RPQRtF5O0FQjz?=
 =?us-ascii?Q?J7dZP9rOf9BWCp6jroomfVMoKPtp0H0TeehaWg8cguuH3h8U+Z0sBkjpP9hX?=
 =?us-ascii?Q?ulsx/45S54918RybG2ZkLl+V83CkVu5WPcE0bU1tfwd1fzFFbQgzNwO/Sj1t?=
 =?us-ascii?Q?RmL7mepaUZ5043DwmlfrTdU2lIaZ+d27ugIocDjwN86W+Uyg8i0TP4Yp2eFF?=
 =?us-ascii?Q?B7NfVX0jRQ6+BdXe49EHJJnJShOsgZPgNCOh+fkdMyFIm63ipwZMT854GMWq?=
 =?us-ascii?Q?W2C8TBAZKNyrqoqi7Bj2oxdm1ZdtKv2XXfiScZ6kT61OEscOosUMfitnbVRI?=
 =?us-ascii?Q?4FRVX2TCSIX4tLyGe4rcYG3L3gA6OfM/qsWhdyUIXj7/A1tp4nKWKYKhsMvR?=
 =?us-ascii?Q?3g65X2EA1fxc1kOx4KBfYDOsQ0fXw1xVV7FzOcrUwvRpK/wrMRO5xTZZtFzb?=
 =?us-ascii?Q?PQor5Lcpf+pi7Qopu7hte5nb+TrBVPWnG8rf6dFdMKLs0W63Q8La+SNgGO79?=
 =?us-ascii?Q?NJafVccQRA3bxIA61YIBXsG1TQnzHI8ubpH1rJ6y5lzMg4xIwwgWmmIsJllW?=
 =?us-ascii?Q?e3XB9L+GyYJmJAMzuZNplJ8TwrNpxOUJVSB4t2dAib4hpo20x7sG0PrD6GIn?=
 =?us-ascii?Q?3wBf7zJM8VCtRuYjk46MHVhO/52/HqJAsKXMuClmUg//SiR60aasQDhpwyA/?=
 =?us-ascii?Q?NYy69kocJ/sInXRIm6BTk64kyRv/c74I17Xsx4Ppek7wizIkcB+jW4zXcle4?=
 =?us-ascii?Q?RkhJzcNkZpyzQqtu6rvCXHxP2KcNqzabELyh9KSNpbLYsAgfyWckqLUeSCsI?=
 =?us-ascii?Q?LYMM7rNY5WH10dPKHGRyQW+/GtjG4AvYc2aigreXTTrAZI9wAd9nHvtTsyWD?=
 =?us-ascii?Q?ncMj2a3hjcCOFpxCUPylVaPPx6SGKo18lKxqbbLhj/L/nl79wOhmVvvTjbOn?=
 =?us-ascii?Q?X0Vtv9rbtUmtOGdwu13oJs8Ev+c5/0T327N85LHfbWsXTzirQs+7dvlchGBL?=
 =?us-ascii?Q?/BMskUNmabTUoOLRpOUGc8+zcUKMejQkPrH832uPQmJuIEmMZQZMcb3H1V8I?=
 =?us-ascii?Q?TNGQYV+mJuf7ubWuBf1q0ZbNRMJKeVIHQ5POkdRp7zq/PHJKxPX72qdVOnX+?=
 =?us-ascii?Q?WQ=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 72a6c41f-d986-4890-ae2c-08dccb2b35cd
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2024 08:42:42.9465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GHzQFSMLiZZQNwiMmmvPTb3m7tGXrZ+k4E3wAnG/HULIGOybACjYDDNeURNM1yCoAzTZ4kob3zmMV4XP82IignI/EPYhETDNhLqGNIngAts=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8256
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 02 Sep 2024 08:42:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5347

Hi J=C3=B6rg,

Please try to add the v2 when sending the second version of a patch so=20
the maintainer doesn't have to guess which one is the latest from their=20
inbox. Also try to add below the --- what changed between v1 and v2.

No need to do this now I believe? Let's see if the maintainer(s) say the=20
opposite.

Cheers,
Quentin

On 8/31/24 9:14 AM, J=C3=B6rg Sommer wrote:
> From: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
>=20
> Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
>   documentation/ref-manual/features.rst | 4 ++++
>   1 file changed, 4 insertions(+)
>=20
> diff --git a/documentation/ref-manual/features.rst b/documentation/ref-ma=
nual/features.rst
> index 2ea946b31d..72e7315197 100644
> --- a/documentation/ref-manual/features.rst
> +++ b/documentation/ref-manual/features.rst
> @@ -197,6 +197,10 @@ metadata, as extra layers can define their own:
>  =20
>   -  *pcmcia:* Include PCMCIA/CompactFlash support.
>  =20
> +-  *pni-names:* Enable generation of persistent network interface names,=
 i.e.
> +   the system tries hard to have the same but unique names for the netwo=
rk
> +   interfaces even after a reinstall.
> +
>   -  *polkit:* Include :wikipedia:`Polkit <Polkit>` support.
>  =20
>   -  *ppp:* Include PPP dialup support.

