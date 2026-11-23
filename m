Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50998.1795428485986505270
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Nov 2026 02:08:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=bImtOThC;
 spf=pass (domain: cherry.de, ip: 40.107.130.30, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W3gRhaUCqs+wN5YA9ffW29S3oqN9LPz6XUkTb711Rl+dxpt6a8i+bIL6/5NxxDDSYUAyOHPyp7iqEHhVrsUBLVljzQpbHQ92gQL8js9lIYNcizQJgvDOG4n59sLg40lKyKvTzmN0NkHpJl4oF7mSGC9+5UhQFgQx1hocnUyF02Hr0fX2VMbciS7r8/adh/+C7mbLq/dXN3/knd+XX8+NSOistnUfash14mgKzibN41tmAB5Y64jZhU9ha9nEtqBODJtarfu8Q5ESBiba1N+CiGaOQQd8Eu2fAOTUL+gyttdh1Ibm9Euw34dzMQFmCMIzpYAlU4BuXqmR9on6xed9rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2HYCJiDsHg1zzZpFbrLf7zQAtkd9lz9tRhcWfqqPN+k=;
 b=ixH20FlDvx5jqgBDPUmaE1bjLc5dMUlm1H6ziXYGczjLp/RiRmirUbyw7AL1JmM6i15mpJzLl082aj+yHOG2NdK2Ll5dy2lFUXMQrZVvlflfe/2l321kmr05MX8hEJWM8d9gwcipLRYK5QtQOKTPJSzGsLtTytYwIttb42MFyyElO3oovkH/xmVumIPwKJ57aV8xXb0q6oRTO0C6A4Bai8GAk3Q7IEP621BYXfeuerbjDZzLw03cVgLZAcDIgB930WlIjd8pfXx/s6a9CwWAirEvzYC9+kaPDeToVVAMqSL+BuSToGx9HamhOuIEmgWHwBJTbiV6OE2baQc2aibJEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2HYCJiDsHg1zzZpFbrLf7zQAtkd9lz9tRhcWfqqPN+k=;
 b=bImtOThCdik0Ni6HXYk735YCwfi1pYQ1Ay9hYQU4jY3PV8jPL2aNxf0ZIoHzjatKgPvg6C+rmpjdLkps7ZogNpLay23iHkZoSLuPeVxApaOj1rp4i42L5cnMXYFcwaLxZEVFjIBzw77JU+2fqjB1bJb+gmrjbGa5XoCZ2sq9OqY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com (2603:10a6:102:4ab::7)
 by DU0PR04MB9297.eurprd04.prod.outlook.com (2603:10a6:10:354::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Mon, 23 Nov
 2026 10:08:00 +0000
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d]) by PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d%5]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 10:08:00 +0000
Message-ID: <55d970d6-da6a-48d7-b3e3-eda5bbda37be@cherry.de>
Date: Mon, 23 Nov 2026 11:07:59 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 3/8] conf.py: enable the sphinx-tags extension
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20261028-tags-v1-0-d5ad01019eae@bootlin.com>
 <20261028-tags-v1-3-d5ad01019eae@bootlin.com>
 <b2f3e59f-32c9-4039-aad4-e9218e8d669a@cherry.de>
 <DN2GLFQMAK3A.ZD9E1I8PU6JV@bootlin.com>
 <DN2HBVV40XL7.1X0R6JHGXNE1V@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <DN2HBVV40XL7.1X0R6JHGXNE1V@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIUP296CA0150.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:34c::14) To PA3PR04MB11153.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::7)
Return-Path: quentin.schulz@cherry.de
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3PR04MB11153:EE_|DU0PR04MB9297:EE_
X-MS-Office365-Filtering-Correlation-Id: ac61a83a-8362-4d7e-2a16-08df4949a772
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|18002099003|22082099003|3023799007|4143699003|11063799006|56012099006|10067099003|261022115727099003|261026121527099003|261022075727099003|261028144727099003|261021121427099003|261026140227099003|261102123227099003|261022105027099003;
X-Microsoft-Antispam-Message-Info: dXTMUjSrEd9i+ydIVaaMd2gC4SEFSRPoIZnKcPBZsBAMt9Rd8gsykWZwSzRwR+hdb2w/EHniONiWgSaU0HgpmkTOJvEKLK9hVF5lmr7F7SBqSCuQjRZ0RKg8Hduqlmy0jPyn8/gRI63d5W23kF3KzsnrBG4B1CSO20ELZsp31HLt7020Gzi+LiHbGU/+gDXlbMtvZCs4S9UjQyeaB1CIdaHXXRsm4rjxuxIbPVYhlERZKLf/QGV5UapFrG97vrlPgaibBAmieqE0LKTTv1j3n0S7PlzUZ+o4bcvFUwAUJFwBrgJahCL8cGWvL1iy31Tcaz4ILeBcjcVx2EuV5NyvVtP6ehLvMt8VUUfpLtCzUp0StIhUHCeSlXj1zoHLRB3/3ZGaYn1EVhiWY6ZGuLSH6iKPdLcYhxbBCiBRj+lUwBmlKPgFtVqdHfiN+Ndu+MlaLSNrD7MYkHCbtAkDbiaj06ZXGfHcV5vYwIfRqKnchWwEQ8yvhmt8n7juD+UEi0WwPg8bRAqB/b2PijRtK5FPF9TB0ZBZhy2h+bHaRe6nCtLI2uDxEfB96lAc3u5SyHgx+A/ibZ3VF85fQCQ0tGvXtWkbXwPXN8em8pdZFJJrEk2jCUkSravX3+y/5HtNH+ITSrneh2McR2GGch0xjOZePRprOmUGQnZSKUb8VhZ+UoQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11153.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(3023799007)(4143699003)(11063799006)(56012099006)(10067099003)(261022115727099003)(261026121527099003)(261022075727099003)(261028144727099003)(261021121427099003)(261026140227099003)(261102123227099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGI0dmZ6K1RGeTdnQkdoV2NSaGhUZmg2UUc1Y01tRHJRNm9YejJWc0Fvdjk2?=
 =?utf-8?B?VXg4TmR3THBGcGowWTVueFI1Y0ZHWjVMN3hkeEZycXpuT3V3OVBDeEZTNXBI?=
 =?utf-8?B?VHVNYWVjelFSVHNIY2xxbCtBZklmZnV5cGtySXFUTW1aTlVpWkRtTE1pNkZW?=
 =?utf-8?B?L2hSR1htL3hGUVRxaTg0U3NWVXpoNWhSTXBaZUN2YkVTZFFoaWw2dy8zVmdR?=
 =?utf-8?B?bStuNUQ0clliTFhRNllxV3ZYMUZEK1d1OUo2K0xEbHdwZnJVTW40aEJudlNk?=
 =?utf-8?B?VDhxQjIzaTdCeEoxeWxQSHh0amxETmxnbm0vSEZvaVk4aHlxck9iYWp6WW54?=
 =?utf-8?B?b2I0OXFkNkRkQWJ2eklSZzMrV2tsYm5LSmcrNENRM3JSdmJIWkpnUVhDWlcy?=
 =?utf-8?B?eDFuVVRBNFFRemhYazViUGxUUEZZN1BySzl2WHQzNXEraVA3UXppai9UYmhy?=
 =?utf-8?B?d29qSFZraGxFaEl6R2ZhajlMWXg4Zzhia0s5VjUxeTBNRlllc2s4UW44NWp1?=
 =?utf-8?B?RjZsS2J0S2hNVjBFdis1YlNDY0MyWTJjblkvcjBNNVZjaE5QMERaNjFFRFFQ?=
 =?utf-8?B?bmR1YlZ5Q3BNVDR3VXJSRkYrenlaRUZuOGkwc2VJNlVPVHBsRWVYSHlvWDdE?=
 =?utf-8?B?clNhSm94TkExQUhQY2xPRVVvS3FkS2R0dXlCcjJGMnYwTUJFbjdVbis0QW1Z?=
 =?utf-8?B?MHJMS2JlcFlGZ05OYkU1ajViWHdTTi9Dd3lHblFTQ0FKVzJjUE9seHIyUFpp?=
 =?utf-8?B?TXEyMEw1T05qY2pwV0QraFR5MVdNNUN3V0F3WmdqTmtLY1d4MitlQzMzSXIy?=
 =?utf-8?B?SlU2SWhGSjJVR2c2MmFYaUxFUE50b2lqOTlSYjdJeEVwc2JWYzdWSjVKRHFr?=
 =?utf-8?B?ZFdyTmVCQlVSM2dja1Y1TnVwU1V4MjIvK2N3R1htNTNEYkxwSG9VN3Z4WlBK?=
 =?utf-8?B?UisvQnlEZ0ZhdHpMVmRrZE1XZndibzRSNFptNytSQUxjaU02QmxTMkxXbmtB?=
 =?utf-8?B?V1E0dzl4MTRmRy9RQm9LelVSZzd2ZDNjYU03S0lMVjFlaFo0Y2ZGaTZ6b2lI?=
 =?utf-8?B?c0haOFJWK0RIS3h3UDVTZ3ZWYkc1UlNvOU5vYjUyZ0VHVUpkT21rYU16VGxF?=
 =?utf-8?B?K0NmYnFMWm5BR0ZPcDllYk0yMGFBOEp0QS8vbEZuQzdjaWQrV0JZbm1NUFB2?=
 =?utf-8?B?MVNJaFIwdm81V1V1Nmw0Tkl5YlpEQjdZWS9rdUFHYWVxTExIS3pXRjAzL0li?=
 =?utf-8?B?OHA0S3ovaFFxOXdudWVIeHZtMXBSQWxUZDJobmI1dFAxalBabXAvQmFIZnA4?=
 =?utf-8?B?dHJEOHVPS2c2TllpTHpmQ0wxMW5mU2tsc2ZJZWlTTU12b0lhcGdTVExHdzN4?=
 =?utf-8?B?RTFZUU0zOHZVZXFoSTgvS3NwaG04aENiOHJpZWp0ejVhOXBJTERyY0ovTW5C?=
 =?utf-8?B?c29UaWdxS09yaktDQ0FQT04yNG1rVTdTenNUa3Nhek1wUWFYb3ZLaWNLYjhG?=
 =?utf-8?B?ZGMwUW1leWRSc3VnSmpLcHdVVVU4UlRoTnJKaHNvRElna2laK1dxancvdDYw?=
 =?utf-8?B?dEtnaFVOWW9RK3k2d0pGdUFpMlVlREErckJPZDFEN0xhZjV4SzJidHVGbEE1?=
 =?utf-8?B?b3hZWHZwSlZRc3B6OEZGMmM4cW9iV2lWSVpnSXVxcUlUVjZhZm1zUlIrUVBq?=
 =?utf-8?B?U1FPV1lEV3p5cUkzNU1kWVA4b3BTa0tKV3pocWxoZ3hUTk0vK2dHZUZoZDFO?=
 =?utf-8?B?U0VzNm1IR25zcFdPS1ZMb28wM1VoTGR6UVBRMEdVQUtzTEh1dHpneXoxSVQy?=
 =?utf-8?B?dnJpOFZKaC9mbmNjd1lQRnBGM25Gams4cFBFSWhkVTRFc3ZZWXU1dWQ2bnFM?=
 =?utf-8?B?K0w4WWl6ZWRjL1R1akdnalhOZDJiWTdKTWZxWVdCN1BUWUlSRlU3RXpEazFs?=
 =?utf-8?B?NTUrL1Y5VWw0Y0xtRjl1ZDlGSEI5ZklvVDlzSHhhWVh4cW5XTE90L3pKWjJY?=
 =?utf-8?B?TDZrT1hseFA3ZnNOQ0l5cUxmNHp5VFMwN0d6T1lvNElZTTYvbnJuNmR3cEJE?=
 =?utf-8?B?L0MzZEk2QTNDd2pBa0xVRDFQa1ZseFpHMTd3OHFmQ2x1eG9rYm9LR2R6NkFD?=
 =?utf-8?B?d3FTck9KeWRlYjJjMGszVk9lWWJ1Z0xoVVFvbWEzMnRCSjRNd3c1SERPL3ZK?=
 =?utf-8?B?dk5kNUZsMXJxMkFaTHFsWExxYlQzbmg1dWJmaEl3dXpXS0FnbzZRcjM5K0lR?=
 =?utf-8?B?ZDRkLzAvYXl1Z3FtMEl3N1pNdzNqeGZORGNqK0VzOW11RVUzZlkyWmx1T2pz?=
 =?utf-8?B?a0FYVXpwRVdMK0hydVhtWXZ5V2s0Nmg4MWY5Y1lmbjJVM1NXRHFQQT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: ac61a83a-8362-4d7e-2a16-08df4949a772
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11153.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 10:08:00.5088
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: amDF0Q7xtF4sfnYOTjX/AbDrsTQ0LN5RYCl1lX3XJ981PgBOY8AQYS9Rc+ca+deFcBrnb2Ui3MT+CVA7m+SYyx/1vbNR/sPfLDOyz7KZECM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9297
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Mon, 23 Nov 2026 10:08:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10826

Hi Antonin,

On 11/23/26 10:23 AM, Antonin Godard wrote:
> Hi,
> 
> On Mon Nov 23, 2026 at 9:48 AM CET, Antonin Godard wrote:
>> Hi,
>>
>> On Fri Nov 20, 2026 at 6:31 PM CET, Quentin Schulz via docs wrote:
>> [...]
>>> suggestion: set tags_output_dir to $(BUILDDIR) (maybe /_tags also?)
>>>
>>> This should allow us to avoid having to update our Makefile and
>>> .gitignore? It's also where we put build artifacts so it makes much more
>>> sense IMO.
>>
>> Makes sense, I'll try moving the directory there
> 
> Hm, we can't do that because the _tags/ directory contains rST files (generated
> by the extension), and we need Sphinx to be able to locate them. However, we have:
> 
> exclude_patterns = ['_build', 'Thumbs.db', '.DS_Store', 'boilerplate.rst']
> 
> so Sphinx could ever match these files if they were in _build/. And
> exclude_patterns can only contain glob-style pattern, and takes priority over
> include_patterns.
> 

Ah yes, I've been hit by this in my boards' user manual as well in a 
different context (autogenerated images need to be in the source tree so 
they can be picked up by sphinx). Thanks for giving it a try!

Cheers,
Quentin
