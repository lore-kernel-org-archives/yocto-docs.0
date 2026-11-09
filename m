Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5684.1794230654732027005
 for <docs@lists.yoctoproject.org>;
 Mon, 09 Nov 2026 05:24:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=TedXWa6Z;
 spf=pass (domain: cherry.de, ip: 40.107.130.52, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IjLvNShIG1V31wdePISnnqP4PCsaiotRI+HSkVd5NTs3SmFNeWFZzdNlbbITVuvNGr1gInOSpXAWKtMdnUYOcXZamar0Z8Bjkmui+BC6QeTlNhmIypSaGEiMFGnURn4O2QciRfFY2CLj7aQ02AJ/rF/SQYMd5xZYyVbkQ3uY7B4vwHBjryBRey+7C2pUo1V1LKyvL4X1lunZ7sI41hrIjOO8BD4iQkuQpKRE82UqgM7C9N4WgEQXCQwUyMNraWjSUJwWhmx68RlMuUIzZ3PQdZzxV7UTlhnOd3mOC/vprO50nr1tXaNeW/34TOP/Ry38/t9b1thwU2IzIjW5hCtBGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JaQi8oeTqfX2p0IIJME9ow8lcFAOgtVAg3OWTYNYZeo=;
 b=n/jdKG+DDe8Tgq1MiAFVmOawk1aaNHdq/Wp3puSUteYIexJ/X34C3Z582RZjGd9TL0UcmFS1flkx9LtOlELZYBQyISok07rnUFB7VCF9X4x5u7uJhPgL8DaCgDwO0VEWsC8ff9a7c7cZpnMOBMNiiHRONTssajOr9Ab17kTxg2QjBqIe3Yf7hIc0e4/tRKq975EN85VEa7OiIhSwkq5xvNSOxVvZaooRMUIN/X5M6BLRTvyyh0isPwbsNZqYxdUiTlYgPpCa/HASX0qgrUUMRnVDBPy5+c2NUQ/kr5bpxa5XrLqvGSzki6JhGXzF/5dMQ8VEOHs9JLq6jiM1YyOFtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JaQi8oeTqfX2p0IIJME9ow8lcFAOgtVAg3OWTYNYZeo=;
 b=TedXWa6ZhbWQWTH9zCh7msSEYXD0jXaHgOHz9M1zrJ870RKVYlIOo8PqysL97zuEW7TnWpyO8rNeYUtOTBPGH/m2p3LOwoLY46Pa6ocT99fM1QZm017Tks0V55Q1Zt00YX08yWlw3uIajS61YYuXC6b7VZSqn4amq/YWTkY78ZA=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com (2603:10a6:102:4ab::7)
 by MI7PR04MB194283.eurprd04.prod.outlook.com (2603:10a6:290:10c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 13:24:09 +0000
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d]) by PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d%5]) with mapi id 15.21.0592.010; Mon, 9 Nov 2026
 13:24:09 +0000
Message-ID: <75e44cb6-ac8f-4d91-9830-3ae0a83db08d@cherry.de>
Date: Mon, 9 Nov 2026 14:24:08 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 3/3] ref-manual/release-process.rst: add textual
 legend
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20261022-mermaid-release-diagram-v1-0-3351b5799dd9@bootlin.com>
 <20261022-mermaid-release-diagram-v1-3-3351b5799dd9@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20261022-mermaid-release-diagram-v1-3-3351b5799dd9@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI5PEPF00000925.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::832) To PA3PR04MB11153.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::7)
Return-Path: quentin.schulz@cherry.de
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3PR04MB11153:EE_|MI7PR04MB194283:EE_
X-MS-Office365-Filtering-Correlation-Id: 5423a779-b703-4c7b-9e3d-08df3e64bcbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|11063799006|4143699003|56012099006|261021121427099003|261022105027099003|261009223027099003|261026140227099003|261026121527099003|261028144727099003|261102123227099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Q4CesuyjpuNf4/hMHlM78Z13WXE73sa5s8b5SY2d0WZ7GOUAEhYVnJhqH84xH/Ba2uXKBRnP41NTIxBUGL5yIRnFMqOny/HlXXXWNtEcrl3jr4FgsAKltLcVmT/mhN3O//n5iUia/+Ar82FAW9TdOOXLLxaaAerMSB096wpOPc3dSDOyGM0polH4uJJFSJuF84Nkn1M/OaF/8dXb13QK0A/CW3famKTVIwUadosI10m0Mi6y8oa7sQIcugQAb/fm8wszmo9Vd9luLB7kYSg4TEd51oa3vSVrFeh3BCxKMORHdhzA7fLDMI2ZZQ3uRQQn11fboNGL98iEJP5klQnG2C6NTflQgkzfdhgiLDFyC9Uq9luUdBoX+ZMUjdpB/TpYaGgYDak/1t+8bNwvI2qnNbe7pikZhbOEoQ2BDgXHDmHnG5JgPeTKfdD/qRyO6NujO5sNEQWpvZ3bnD7wR9b0WziRWBdv5BQysmOTTNAcpDhErTvNyg0ZY0Qo7/h9PWcfzAqXtXC43NtqZ0HxeESTGdovFBmd9QG9QgfN6nO+6Rm8XO+6fk1soHtjOeJObe6WtmXVbPplHy31c9wgjRMLKvDqa8YVqJIAI+M+CZ2cShUykbKfFuIYqzcydZk8m9abYe46QuNudcs0ITD8gVjWb9Z7aXviRvOBB1Dx9b30LPk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11153.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(11063799006)(4143699003)(56012099006)(261021121427099003)(261022105027099003)(261009223027099003)(261026140227099003)(261026121527099003)(261028144727099003)(261102123227099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1QyRjN6VXBua3NDSStUOE44M0gyc0RDRjBWeHQ4OFM0Vjc2cDhzcG1Uam9Y?=
 =?utf-8?B?T044b3NaWGtMTGEwR1EzYXhBWnhlTjZid0V4WkcvRnc3Mk9TVWRsR04vNkJT?=
 =?utf-8?B?NVlDSm1vWmdmWFdTUWV5UVJEREpCZHgzcDBkUnJkVXVLOStCQmJEM1pablNo?=
 =?utf-8?B?MkZ4UHNNUlJsdVYyNENjZzZyU09BWG55OFB0ZUNZWUdqYUJXZ1ltclFQSnF6?=
 =?utf-8?B?MFVkeEtiZmczWHZtTzNDMU8wRFNoN29rZFoxWkJCODFkTW5Wb0VyaTZGeHQ1?=
 =?utf-8?B?ak9YVjNtSTVYdjRlUVRqVjgyMi9jYkpXZkNYTDVLOTRhbklxVjFta3lJTys5?=
 =?utf-8?B?MVRzSnB6cGlldTVBUmRBcUJaT0luZTcvMUoybmoraWxudVY1TkY3YlBKWU5n?=
 =?utf-8?B?KzQvZTNoUUZuRUN2YXlnZTNqRG13bTIwb3FRbHpQd3hXL1FmQ25LRC84ajFm?=
 =?utf-8?B?KzV3T2hpWmRtOURaODZMdTVja1VseTZaYjBzK1hWaXNKV2hRMU1vODhVbXda?=
 =?utf-8?B?d0p0MDNJdWwyMmtiaDZnZU03SHFhQTlJK1V5WUViMjNzL2FoZU1kOGxPMGtv?=
 =?utf-8?B?MzhPRFprRE91SEU0L3ZXVnZBZjlhaUJjM2ZrUHYxZ01Na2h3c1ZUMzJ0bGJy?=
 =?utf-8?B?MUozN3hJbTBBeWxXVzZjSWRSNjhnMUpadHZEZXJkVS9nejlnK3kwUWR6ZGho?=
 =?utf-8?B?MVBBNXlZQ21qQTFFY3ZVL3Y5NTN5TFViNjg3WG1SV2I4UGNEUCtZY2c2TVZt?=
 =?utf-8?B?Zm0xSHA0UDk1RzVSWVhJUjNkblBVZVc5QjNISkJpWksySFV0U0FqbXB6eXM3?=
 =?utf-8?B?TjZnSG5udCtkTHZvV253S2cyNGhiNVFzYTZVZk5rcTkyV2phcjV2Vk5URjh2?=
 =?utf-8?B?MUVCMlJSaVBlR3NNdm9CUFR1N1BtSXYxN056ajBvY3pSSTdMQVFsb0VHNVMw?=
 =?utf-8?B?ODB2eTQveFczMXZXdlY4Q2xhWnlwcE0wMGlya293cHcrd3B5ejNjTURsUmEr?=
 =?utf-8?B?ZkxKV2d2VVd4U043UzJlSEgrbUdiN2pXbmcxS1lqZG5PQWRkeHVkUC9hKzFU?=
 =?utf-8?B?Z2FFVi9GWU1nQmU0Q2dTam94RGUrQmg3eVQ4YklzTHMwYkdkWEZoVVlEd2Y5?=
 =?utf-8?B?WWJ6R3N1bkkrbzc1bVJieXNOTk8wRTQxSkR3ZjVWeDNWR2ZTKytYbS9oVXlw?=
 =?utf-8?B?RmpWazZTYzAyYmFlaTlhUndjeUgwZUlPWThmVUtkejgrcktvNkdUSXd2UDRp?=
 =?utf-8?B?K3FyY2R4bDJGMC9QcjA5aGtnQVRmUDlnaTFYUzRjU2JJQkFyL3hxMTJ0K3BR?=
 =?utf-8?B?NExlUXZiL1lRcURSWnVWVGRoZG1FN1VVemsxUmY3em1FRnBTU1FvZ0JJNFZs?=
 =?utf-8?B?cnovb2NOUlBocEs5a0V3NGRpOVpwWVQ0TjdFREk4VWhXTTRJZnpkR0dRZ1Q3?=
 =?utf-8?B?WHozWXNtNFUwR0tHamRlN1lmbTZuVGg4N0htK1ZNMXRCYXFKRmJ2QmJwVTBy?=
 =?utf-8?B?UWVmcWkvay91MFB1REZuVEc5UnNXVDNzZVRtdzhoQlowZzlpL29XdFNYVk83?=
 =?utf-8?B?d1lnYXAwV1dnMzQwR1JCU285bUtmU3dzS0VyeEFjMkZ2dVVFcHE3aDd4OWwx?=
 =?utf-8?B?VFAybGp4TEdxMi9TS3FRekVNQVE5em9DWEJYRVpiSlNwT3E0V1ZKM0Vhd1hL?=
 =?utf-8?B?bUpnTFNTMFpCaWwrTlpYRERMSHNuMDN2bGpaL1RKcjNKbjgwYlovaU45Q2JU?=
 =?utf-8?B?TmpIUG84VzlVcU5Cck4vL1NxVHB1UFlCVVpvblZGSkxCVG1GaFFLeU4zSlor?=
 =?utf-8?B?VFlPcm12cUwxbmVTL2NZV0c3YWxHTU5nZHdvYmYxOFdwL2hjSWJ0SlNMbWdl?=
 =?utf-8?B?ajJ2c0dmQmhtQVMzRzVFckZJNTBNclpuTm56bEU4K0p0clAydmV0THdUZlBa?=
 =?utf-8?B?LzB0UVlGSFE1dW9sN2YyNi9ZeDZiZk5qanJTSnpvR3FHTFZYT1BlTGcvbklN?=
 =?utf-8?B?TFFxdmZHTmNYU3ZQQ1RSQ0l6MFhoZG1rNU90Qm1idms3M1lxTnRqRnFuMFBX?=
 =?utf-8?B?TEw0RE55alFTVGZSQ0M3V0E1aVJFcG0yVmp4eHhOL0JtQ3Uvb0NNdlVQNGpZ?=
 =?utf-8?B?UUovTTBTSlhLcnVtdzQ3Ty9qOHU2ak9jbHUydlN0N0tPL3Z5eW1maXowbVBa?=
 =?utf-8?B?T2FvNXZSbXdiUDhycGI0S0M5ZVhkeWhsVEZ4VWpxNFYrYXZyUmRseXN4alEv?=
 =?utf-8?B?QjNpVWJaejBnWG03N2p2N0V4YjlBVmxTVkFJYThHeFBaNnBjWHdNZ2RORjM0?=
 =?utf-8?B?ayt2RndLVEhlYk90b2ZwUGZzT240OHppTG5BNlArZFJqSENHK0NZQT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 5423a779-b703-4c7b-9e3d-08df3e64bcbe
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11153.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 13:24:09.5850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dHjwWRy2W14TjGIk5mvXwAs1PykZgNIA/7EXxsTWuJHvRsjey1EZnySfWfuPStCOBTgVDyyNxhcXxaSGOPG5F5E6Cb+Z2BeoxAlS1tbfGgs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI7PR04MB194283
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Mon, 09 Nov 2026 13:24:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10784

Hi Antonin,

On 10/22/26 3:37 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Gantt mermaid diagrams don't support legends, so add one above the
> diagram in text format.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/ref-manual/release-process.rst | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/documentation/ref-manual/release-process.rst b/documentation/ref-manual/release-process.rst
> index dd1844fcb..a75d916bf 100644
> --- a/documentation/ref-manual/release-process.rst
> +++ b/documentation/ref-manual/release-process.rst
> @@ -281,6 +281,9 @@ of stable and :term:`LTS` releases.
>   
>   This documentation was built for the &DISTRO_NAME; release.
>   
> +The diagram below shows the currently supported releases (in blue) and
> +out-of-date/future releases (in grey):
> +

suggestion: use ..figure:: instead, it supports a :caption: option

Cheers,
Quentin
