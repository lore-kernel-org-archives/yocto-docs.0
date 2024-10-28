Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D7FAD13588
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 10:40:50 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.65.53])
 by mx.groups.io with SMTP id smtpd.web10.48799.1730112048573796613
 for <docs@lists.yoctoproject.org>;
 Mon, 28 Oct 2024 03:40:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=DIUMd6X6;
 spf=pass (domain: cherry.de, ip: 52.101.65.53, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L2frMcLxUwXNVLJS3SuH4DespgdOMMLnT64Kw8xJ7auLKpUPqRGJvFR+XpTsUpMsy9kKqIYbFp09T2o4m1Xm4vdtZ51m367HIa8U7+o2xF/FHCJiCDPniLDm1eI0YhrD0MDDfnvM0vUf6LuRk85R7VUZC5SCUvWDQXZPmUQqsuRw7N1sL5FkHbflv0G4Psl4b8WXdq10r54PuB2/0L+ruvKtrUgRAJiZQ0irsACfaFp8F8DIEOItRmRkb6feIpzmaBh5ba98sgkPzS4xUUdf03ju7++xtS8SHPmsJjm7u9vglLo3FxO2Wr2GN1Iul287iGV7AHFBEWQEwBwaPpKAJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=85w9wq2nJM1qwoME5S2xrjYLW7IYUvHGYw/LuMocX5o=;
 b=h9eLxIDvHlHTdm0xm1hnyfHBrdN6D1dZ1x4DlokF8KUmld3a4ShQGXSQmeZpPtju+L4biJNUGkTr+Q4L6A9dXnZ3Ll1MYEVvaHXazM6GCia8/Ah7wyD0TQS8PaZ/JKWHPL2rBFpeOwQuyqbDiwVLlcCOTMIKYcZxWZ5MJ0NLb3DqsTbNix163KbPZUgJhWOSzGfjLiSN5PafZCew3e98AJP8SIJbZREGGhQUU/u1DZyJGNGVuvt9arcpQWfHlYL49WkoeMBOgu7WIWs5dXaAhTkaRWkM8m4C8L5eB22qwjo0rUEmLx4YYV9k4u0vC9zvKGSpR4j4I0wfLzlcBcvvlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=85w9wq2nJM1qwoME5S2xrjYLW7IYUvHGYw/LuMocX5o=;
 b=DIUMd6X6rQfyzAaDIvXyn5zB4p36UR6ynfK6OVUDs/Rf1QfB1GQ909Sv8HSFk5bqVVZNUTnYU1OeyqbIb48OhgV3iY7Zkbf3i+/NfQQNYE4is/j4xPqFMCxQD4kiJnLQkhB0D6QDmqsCFVIEcZgRP1x5bhHgsdr05Fxe8E74WgE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DB9PR04MB8092.eurprd04.prod.outlook.com (2603:10a6:10:24f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Mon, 28 Oct
 2024 10:40:44 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8093.025; Mon, 28 Oct 2024
 10:40:44 +0000
Message-ID: <04ae83df-db00-421b-9510-e246e8bc31b5@cherry.de>
Date: Mon, 28 Oct 2024 11:40:43 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] ref-manual: release-process: update releases.svg
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241023-update-releases-svg-v3-0-a8367b5d4854@bootlin.com>
 <20241023-update-releases-svg-v3-1-a8367b5d4854@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241023-update-releases-svg-v3-1-a8367b5d4854@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0162.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::14) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DB9PR04MB8092:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ae1de03-af40-41c7-2fa8-08dcf73cf9b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TDFUZUoxMU9GaXBxWnZ4eXhIbk5KeU5veTBkRXo2aEs4dEhRN3ZaQ05QZmNP?=
 =?utf-8?B?VG1xS3JoeEFROXNTWmJIL0g1OVlWd2FrRmpPT3FHVmFQVzV3TzZ6N2tQbEVy?=
 =?utf-8?B?U0NjN0xIeS9vRWhvL3hISVAwTEh4R00rckpxeDlUR05sUUdFTjZLMmMzTkJx?=
 =?utf-8?B?WXIxVVl4NFREeDZxNFhwTUZ4QnJrRnk3TU11Vkdpek5QRDVxKytGbDVjdjRW?=
 =?utf-8?B?ZkEvaTlraXc3NWJsb1RsMG5yZzhCSHRqTDJpaUlPRmtpY0VYNXcvYUxFWnJs?=
 =?utf-8?B?WDZBYmxoUVV2WHdUT2p0Y293T25uY2tybnUraWJDMFY5SE9hc2xOWlFUNGxI?=
 =?utf-8?B?djJNMUJrZVY2SnhHVk42dncvcUdFc3hPWkV2RzZkVFlYWklRd1c4KzJJaWZz?=
 =?utf-8?B?Zzk5MUJ6ZllwbzZoNFBCMEFhZ3VVOFB1RnNlcHVlRGM5ZkdQZzBlTmQ2MSsx?=
 =?utf-8?B?ZVdKcEFPQllua1BhaEJpN0pwRzl5VjFHWXArZ01XSTN6eDIwcjZXZHFkdHVO?=
 =?utf-8?B?bkU2M1hNcVN2dXV1b1hZeUtrMk9pUzZZN244aFhUY2JKcWpvMERkMHBxRTJQ?=
 =?utf-8?B?Zzh1Tm5tWlY2bFViSHc5NjNBZnZtQ0FxOEwwWjI4SCsyTEFWMjlkMituLytj?=
 =?utf-8?B?U2hBeVVQeXAxS0YvOTNYeVByVHVJR0hyeis3Ump5VnU4S09IeTc2YWE0L2R0?=
 =?utf-8?B?T0hXalBJTWNmbHpQSzNmUUNtK2JTcjR3UmUvelFFc3ZKbitDeUxqVUJCMnht?=
 =?utf-8?B?K2FEV1dIRWpENEpsajB1azVQNVdMYlBRcnFoQ0g1Y0lhMFMxS0ZEaW9DK0g0?=
 =?utf-8?B?NUtZTTFCMUlISTk0YUExU3FTK3pSNkY2Umtzd3NDbFphM0YwelA4REVRU2VG?=
 =?utf-8?B?NG84TFRhZmVZOVd3eWJxaTY3Q3JzMU9iY1czNEJ1VVkvSGNGSWNxaW45Zldl?=
 =?utf-8?B?Qm9ZamZqRkVJUGt2dkpPeFhMMXNvZGlsd041dnM4ODE1c2xFVnNIc1k5UjZZ?=
 =?utf-8?B?OTZLbTFVYmUzcnVjODlQWVA2UTd4QjRsUnRidXVacG5GTktCUGE0YW1nd0Ux?=
 =?utf-8?B?VUNFZHNrMm9qWUpxaGVCV3hZczlPYk1UTjdkeHlWakxuSXZxVk1hUWNwNjY0?=
 =?utf-8?B?c0tDSFNMUSt3aWNScHVVNEhCd29ENlcrUlRTZ1VGTFFwa1VyYk5Kb1ZjMktJ?=
 =?utf-8?B?TEpuaUZ1YmE4bE4vZGRQU2ZMZmdtWmZqdHA3V1dob3VaSjNqRFpETFBDVjR2?=
 =?utf-8?B?TVl4eSsxaXFrTVNmNlhuMDUxdnNRY3JMWHczU3RQWGxyODc0VnEzNGhmek5n?=
 =?utf-8?B?WVM3SkxndnNxaWo0dVEvSWpLTEF4SC9teHRPV2ZDSUdPUUg3ZXk2TFdCcGxT?=
 =?utf-8?B?a3NmanEzRjdCVGlTRHdWQi9oT3grQkQ4WmkxR3M5SllCWGhhbEthZVRuZUUz?=
 =?utf-8?B?bWF5ODBZRy9oenRIUHdZQWNDNnZ5MlpaQWo3WXBwU0YxR1NEWlNuenRUMDFt?=
 =?utf-8?B?YVVLVkdnaGZMbitkWENpY3hGS3d2VnVDRHNHbmVXZlI0eHZRWlNKenk1V3JF?=
 =?utf-8?B?dGRjN1l0UUdHQ0p6YXp4QVB6WGFITnlaWW1tU0VwSndlRHpYMzNwZk1odUxs?=
 =?utf-8?B?SjdONDMwODVWbUJKTS9yY1h6YktzYi9yVVRPbGRodDZ0WktHWU1ZTnc2L0lh?=
 =?utf-8?B?Z2JjUVpOYzdNdjR6aVJvQ2VVazQ5bVY1RVR4OHVYT2ZYY3BrOFJ5M2F0djFY?=
 =?utf-8?Q?ZiptHENUfOSS8fVjtD1rAbVabRgTOvPg5hWBro7?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VStNMDliWmwxc3hsaU1IYkpacnV6THB6VDNLYllhVGhjYzZ6R3FFRDRXMXVo?=
 =?utf-8?B?MXNLSlcwQWYvU3FtNndkWkJZa1RyUzBoV3l2VHhZSzJ2YWVqRWNIckRoNDk4?=
 =?utf-8?B?VzFVTDUxTmRwYzRuTERLMzJOWGFmWUdwb1JURFRibDNISXV0azZueDYxOTVj?=
 =?utf-8?B?ejUvZU5ITVdUSkduWmNuczRJM04zQnhpZjNjcmtyL0hlRmNhOGk5bGl5bFVx?=
 =?utf-8?B?aFBOZFhwVXQyR0paaXhwYUcrR0xoelpUWHpweXdJL3JWOEZPazBDbXgvTjQw?=
 =?utf-8?B?aWM2MllNNzJOeWsxanRzUmdIUHhFWCtZMkNqem5yTXFCK3ZDRFEwVEhGWXha?=
 =?utf-8?B?VXY1U1U1eDh1M09DUDhsdENVMFM5RXF2UWxmSEJzc1RIZ1VvcHU2QVg3NUdo?=
 =?utf-8?B?Zy8wMlN4d3FtVDlVUzVqckE5V2xqWnp5Y2hCa1ZPWEFjYVdHeWYvMmtjUll6?=
 =?utf-8?B?czA1VkFvUFpYNmlleVY4WmVSY0FpbGNpaWdpQUxyeFBRMEl5Nzc4WDhYa25V?=
 =?utf-8?B?SmlvYktQOTM3NGJ1eUdYbGJpQ25ET1AwR29mRGNuaXN2UEFjWXN4T2JDRTNY?=
 =?utf-8?B?NzYxc3laT3BndmRIS1VIVEpCK1AwTEo3T3ZqcFd6QjZVYUNUZUt6RnFaRTdU?=
 =?utf-8?B?ZEhDb0NrbTdkSkw1aXVlT0NKbm54U0F4TkFxSzZBd09mVWtjdkNqN29QODRj?=
 =?utf-8?B?NXNtWkFWUTJidFBjSlpFa3U5MmY0VENDZC9La3ZQM2tDNG5KZVZkTGZiZkdR?=
 =?utf-8?B?cEsrYkY2TmVkc3NpOGF6VTR0N25DM2NQUlJ3Q21sd2JTTlZPb2tOMHo2cnph?=
 =?utf-8?B?eGZnbStVeVE1VlEwaVV1WkhDbG4yWDZoRTkwajZJS2RxZUFCcU12cWpFaVcz?=
 =?utf-8?B?ZC95andBUXhqdSs0U2gvc0E4SWdWYzhKV3UyRU5Dc3pSaEVwSDVCa0ZmVllS?=
 =?utf-8?B?enRIWWFWeVN5S2tKUnZFeEZVV1JuVkhkaHRxdUNkbHhGNHdCdEgvempsenZE?=
 =?utf-8?B?WCtkWlg1Ly9oRGVjeXZDN2tNbzE1b0pkQU1FNmtIblJnVDUrZzVvTEtHVVha?=
 =?utf-8?B?c0g1dDdqRjFuQnp5R3YrNllhV1FSbGF6YW56cVJ6OXBhTnFuSk5QN2tBdFN5?=
 =?utf-8?B?elJSOXpnVFJOcW1kUStDZ2FrQ2NnK2wyRGlWN0t1WXhnMlFVN3hBS2VXYTNx?=
 =?utf-8?B?aUF2SWF1M25VUmJ6SlIxOWRPNHR3TUtpWGdxR3RkQnRldkZCY2pIeVUyVHBn?=
 =?utf-8?B?Q0xVZ09zV0xlaU1oeDJoM2plaTFqYjM4Ym1jOFVoTmhpMnlDYkxDVzNwZitG?=
 =?utf-8?B?eVZudDlleUlZYXppamNiL0JiOHVkK09WOVMrWWE3Z1ZaaWZ6UG1hUzBHZGdE?=
 =?utf-8?B?MXNMWmROaWhZeGZsTW1YbkEyVlM1Z0sweWQvQ2RJQzVJQlNKa0tHRnpVZTNy?=
 =?utf-8?B?MDVTbHNZeTV5UXlTY1BuQmhLb0tLSGtLUktOOVYycEJTWkN0S2RXY2k5Y0pp?=
 =?utf-8?B?bDBXYUtMcUVUS0VncmtCWG1KdFFmNzdRaE9IRDIwbW1UVXN4MUxHSURGaWJt?=
 =?utf-8?B?NG5aTUdyemI3NEw1UHowTHRwTDNHbWUrNXhOblg5UGdRa0YvdWkvSGxGUnBn?=
 =?utf-8?B?NVZlODBBK21DQkVLeEt4QjJYdnlTcVBCYnowZnZrejYwQmFudXhtRGRmZkh2?=
 =?utf-8?B?NXNEV0tIS0s1QzZWMmdSNG9UWElQUW5WOElKRGFPTEZMSjc0eWZxOStmeUZJ?=
 =?utf-8?B?aHJtR3cxQkpUdWlhR0NLb3FJUFQ2a0NhcWIwWmVVNnhydnpZM3ZwbnFQSysx?=
 =?utf-8?B?VGpnUFB5cjM4YnpiVmlTMkNsVDNaeDJBMGQwUSsvRG5oUVJ4Y1A1czVTRzln?=
 =?utf-8?B?eFBCNlAzR29HaE9pUjRIdDZHcW52QnJaWVpQQVBEZjJTR0JtRDR6N0tTYVZy?=
 =?utf-8?B?YUJiMHdPNko3WHdmZlJEUmduYlJaanIxRHpmNFdhd1RPU3RPWXp1YWtWU0Zk?=
 =?utf-8?B?cEZoV2Jwak5xMlpRN3l4c3pEd1RiWjNPaW4wSUQwa0hRNXlCS2xSVDI4Y2Ro?=
 =?utf-8?B?SENJZEJSL3R4bUNHbGJyN0dqM0V1aHFLTnFtbjhJSGs1dDJlZEJmMVJYeDkz?=
 =?utf-8?B?OGhzc3dCczJta0pIY3Q5WEhjZlhIRmJFd2VVcjJlTkNXV0lON0tNb0ZuWEpr?=
 =?utf-8?B?Z3c9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ae1de03-af40-41c7-2fa8-08dcf73cf9b3
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 10:40:44.1583
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u6yFGLlMoBjWeWgESwoFjD5kv4ltU8qYRroDw7xHDGyWjDmTvBB8iGQBlnuEi+xg3T8gEKQ5FNCVDAEebX5qUCv0tR5mV1or3dSBNedCxFw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8092
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 28 Oct 2024 10:40:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5600

Hi Antonin,

On 10/23/24 9:32 AM, Antonin Godard wrote:
> * Add Walnascar release.
> * Remove dunfell, gatesgarth, hardknott, honister: these release are not
>    supported anymore. Start from kirkstone, which is still supported.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/ref-manual/svg/releases.svg | 907 ++++++++++++------------------
>   1 file changed, 346 insertions(+), 561 deletions(-)
> 
> diff --git a/documentation/ref-manual/svg/releases.svg b/documentation/ref-manual/svg/releases.svg
> index 036aa467cc2e646e99bc407bbf0ea7ff8825f57b..b1036e066ceb65a7391cec616cb4304094728f3f 100644
> --- a/documentation/ref-manual/svg/releases.svg
> +++ b/documentation/ref-manual/svg/releases.svg
> @@ -2,11 +2,14 @@
[...]
> +    <text
> +       xml:space="preserve"
> +       style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#fffefe;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
> +       x="1659.087"
> +       y="-3.6722763"
> +       id="text1185-3-55-4-0-0-0-1-1-6-4-3-5-2-2"><tspan
> +         sodipodi:role="line"
> +         x="1659.087"
> +         y="-3.6722763"
> +         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';text-align:center;text-anchor:middle;fill:#000000;fill-opacity:1;stroke:none"
> +         id="tspan10317-2-9-1-4-6-5-6-6-5-9-7">Current</tspan></text>

This is a bit dangerous as "current" keeps its meaning while time 
passes. So building docs from years ago from a tarball will still say 
"current" event though it isn't really supported anymore. The X axis 
showing the dates should be enough for people to get the idea, but maybe 
we can also add the last update date of the SVG after Current? e.g. 
"Current (Oct. 2024)"?

Additionally updating that SVG for all releases might be an issue. If we 
backport it "too far" then the release of the docs will not even be in 
that graph anymore, which is a bit odd. Moreover, the paragraph in the 
LTS section may become outdated as well.

A random thought I just had was to maybe treat this the same way we do 
with the migration manuals, that is to take the source from the last 
release/master and inject it into all earlier releases whenever we build 
the docs through the autobuilder. We could still have an outdated 
version if people build it from an old tarball but there's no much we 
can do about that sadly.

What do you think?

Cheers,
Quentin

