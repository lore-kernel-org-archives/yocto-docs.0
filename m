Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E882CAC582
	for <webhook@archiver.kernel.org>; Fri, 12 Sep 2025 14:23:06 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.55])
 by mx.groups.io with SMTP id smtpd.web11.18114.1757686975969290194
 for <docs@lists.yoctoproject.org>;
 Fri, 12 Sep 2025 07:22:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=bXyyiQTs;
 spf=pass (domain: cherry.de, ip: 52.101.84.55, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gelhZI4FTkTj7QB/sOkAIANFJV/GNdJm9LF/5kqpz3906FQ35rI+HGrPHbQhbTljSb3f8c+8Sm0gdqSsWl8qDzBMfBfb+HaMMcNIUcxUMeElRDF5o1SO5TCOzAm/HjSuym9+ejeilMAVoGTUMWrIDeMyM7dcY35ijcxUoaps6MZjtAYxCWafxMnT5k3LrsD2PrTnfZ3UdVjrG2Xb9h/EcPaNzJPSRCRenAYgbvbshjJT1UInW7yCT+JJa1F0fr0Z6YjXKhSfR1RHdPENt04QNDBfRmfaQUSjFcwGlZz/yGMlfK/IlnhPaQrbs4ITjqpJbQfpowPEHHgKBM5EntsHrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tPv6ZV680feMQdJA9FtAxKVbvsdsv+r+4Spz8RIsbyk=;
 b=DkSVykUxtlgNlXkBw4+DmZif3csID5U5Tc5oeMYFXqYRslWNWbM5I2QC+3NsOBQ/22CfVex6WcPxFQWKd/xzwgOw/Jm1x7a+151GMYKse/L8JjqgQid1hAGA9/buv9P/Q8PDmKvSItJ2oE2WmO8B8/8gn1OcvA+h0gPEdvDiTgWfwhWlGjPsyhm3PWg+p/1+i+3DtOzvFFcTZVyLU3X6XRvXPEgGEqLm9LZyvNx1QnHTxk/aybxEY6vWweKJ0+/T/hdixBPAPgHl9FLofmRu5ebCi6/zgoC0/aKmlRjW1dIbSrEeGEBmG+DjKxjDMtuiYgctiCDz61Zmkr47n21EXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tPv6ZV680feMQdJA9FtAxKVbvsdsv+r+4Spz8RIsbyk=;
 b=bXyyiQTsnwwEDTG3+x06eW1KJo+/mDwb9OmbWwmgk9BJ+FAfb5BCRVrHDqtKAj9PHfYCm9+6tD6jxkjEeN61berWO1AAlNswMf+ZCo+c7L1DLjx0exJrJ0mQTVTDXZSc+aoGDhxcfSA4NZzJDWaPuUZ2heP5r4t7/mTja35Gopo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by PAXPR04MB8638.eurprd04.prod.outlook.com (2603:10a6:102:21d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.15; Fri, 12 Sep
 2025 14:22:52 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%6]) with mapi id 15.20.9115.017; Fri, 12 Sep 2025
 14:22:51 +0000
Message-ID: <2d38bcf1-2371-4018-9599-4c97d2fa2792@cherry.de>
Date: Fri, 12 Sep 2025 16:22:50 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] migration-guides/migration-5.3.rst: add note on
 systemd pni-names change
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250912-systemd-pni-names-v2-1-2615197df69f@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250912-systemd-pni-names-v2-1-2615197df69f@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0182.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::17) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|PAXPR04MB8638:EE_
X-MS-Office365-Filtering-Correlation-Id: 51250fc4-3f73-495d-0556-08ddf207db4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?OGoxcFk5VGkwb2dWekVERmFmZDlYYjJyZCtWaTZNcVBJRnhGdkhINWt1UDlk?=
 =?utf-8?B?NlhnczZKZFpwVHFwMTBiaTBRckx0MFEvaWpwYVVFYXJ0MEJJdmlNMGdFUkhs?=
 =?utf-8?B?bzdZU0VGTGs4ckFnTHJkYjlwM1FVbnhJMHlBSVRreTdYOVFMdEFWNUVWMlQx?=
 =?utf-8?B?L1hyOWU2ckNxYUdvREh6clkrWXFhdGZSZG9WZlNRNUFZakJCS2xCOXFrWDNs?=
 =?utf-8?B?Y3gvbHduSXlTM2pERlROU2Z1azJjRWdmMVAvcW9MaDFHSGpWc2haMlIxMHZv?=
 =?utf-8?B?bEk0TklPKzdvN3l6a3QwakU5NGJEZmdqbGVrVU56YzlXUmdGNXl4VFpLWnJY?=
 =?utf-8?B?SU9NM1lISk53OWFaWTF2MEZBSVhUS25yU2RySzIyTnJnWk9WUDlJQ21UYnR6?=
 =?utf-8?B?R0pqdExSYnN6Mml1Nk12Ty9uSTBzNFNVRjlEWjgxdmEvR0JmNEJ5N0ZXaFpU?=
 =?utf-8?B?RTI1cXpEakxZQ1kvcGNLSzcrMURTZnEyRCtUWENuWHZJTlhUVmJ4amJpQm9J?=
 =?utf-8?B?OEEyYVdJL3lHK2k0UnJVcXdIbkhEMi82Uk04OVRiczl3ODdkYk04N0c4U1Ra?=
 =?utf-8?B?UkZVOUlQam9oVTI4MXhvMXQ0SjByR0R6UzFuTUJhS0R4cGx6QlozblNuaGVq?=
 =?utf-8?B?ZHJYZnpJdWNsSk9adXZuZW5oYm9IZ1JoUFp3ekdEOXF3RGxORkp5cGtiUnYv?=
 =?utf-8?B?ckNQNU0rY045WHF3T2d0WHJjbmcxZDU1a2dzVXYvT09nTHhwTnYreDlmUkg4?=
 =?utf-8?B?YTVDQVNkT25Da3N1ZDAybTJpdzVpUW5qWDliNytmTit3Y3BIMyt5aklDOFlr?=
 =?utf-8?B?U3dLUEpBdGxzdk9Rd1V3eldtZlI1T3FQblhXTm5JRWx5ZVVzOWxPZ3I3cmd5?=
 =?utf-8?B?em1RbVpCZlFndFZFVXNMYm5iYklPNjRycGZwbjBNMVN5dXB0OE1YRzlvMzVn?=
 =?utf-8?B?T2t3b0ZNT3NhYTMzQkdnbXRzSEptcTVPTDBEaXRaUEp4ejFKRElaaG90dW5E?=
 =?utf-8?B?MEQ5dDJZSjEyTXh4NStOSWt1eHZjSmN5a1BBRHFjRGpyRXJRcHZoRzRqR1pj?=
 =?utf-8?B?Y1ZZcHk2bjdyVTlZT2J6MFB2bUl3M25sMU5NMTFtTlIrVkxtNVZnQVF3Z1lU?=
 =?utf-8?B?S0xaWU9jaXNEVFNYbFZLOHovWk5iSlRyTWhnVTZNTkVHb3E4Q25vMkRPRXdy?=
 =?utf-8?B?TnBueGlUd3RDUVIrZDZnOWJiQmFZMVEzWFIyT2lVOFJCQlBMeUtodytPTGty?=
 =?utf-8?B?QW85bmd4SWJhQ3lwbkdrNEY1QkJYUi82aTZtb2lWNnFpVWEza3AzdHJLVkp2?=
 =?utf-8?B?MHhESGJZd1YrV3hDZk0wSGR3cDVrZ3psRWdHVVE1elkzc2FJYjVBV2J4SE5l?=
 =?utf-8?B?cDNHVmtrM3NSVnVhZ0IzN1E4WW4zNERiZWQwMUdjQzBJQmo4Q0h2bW53cE5r?=
 =?utf-8?B?NTFJWjBST0h6NVVMSzVkUnYzSE1RWlRzbVZ3YXpxMXJBZHR6TlJocHJEcnhB?=
 =?utf-8?B?WG1XdFZaVHluVzdJQ1BISnRQVHVsM3J3aUJyUXpqajBrWmx1VGY0U3dJZG1y?=
 =?utf-8?B?MExpaXZPZ0FhZUNnSElhUlJKVkNLZE5MN09oVytxcCtlaHhuMEptem0vdmVn?=
 =?utf-8?B?SjJBdFpIQUVDdENlZjZqOUdncmcwNVZ4b3lFV2pHbmZSczUwV05ncUwrRWpo?=
 =?utf-8?B?dFVjS0F6ZEdpaXZzaHcyVXEybERZV2xsbTdyWVVBa3NNdGVHUjQyU3g2L2d2?=
 =?utf-8?B?eE4rYUhsaG1kQzlrb1ZPak5lZ3B6WGdjaUUwUXJWVnU1TmhMd21Pa2U3SWoy?=
 =?utf-8?B?UnRWRHFGVk52TXdvRy9ZMTdDMWVsd2NHdmhNR0toUWFXbVlEclh3bCtQRDNz?=
 =?utf-8?B?YkZDcHdFb3NhZG9OREZ0SHVXTk95aVZ5T3owNnd3bnhTYUN6cTBVdUNMYlpk?=
 =?utf-8?Q?FGQchMh3x9M=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eGJDMDAyTGZHQ0J1U1V4eW5sSUxRZUREWGRNb3V2REJqUStxRUIvZFJDYTRs?=
 =?utf-8?B?ZVVyL200UHhjYyttSGxVWk1TRmVKa3JuS0EyN0NVM2VFcHdzamwwbVd0OVdC?=
 =?utf-8?B?TjVqS3Q2WE5RUGJYL01sQ1JmMXZpSjVBSDFaK3pwK1hVMnlGdWdGaHRnZHZn?=
 =?utf-8?B?c1JXajB2WnRHYndtSXkxUUtIKzkxMmN2WU9WSklWSk50VHhlNjBrVUxFaE5J?=
 =?utf-8?B?ZUhVZjdYWHRSSVlDOHhHQkhEbXVNZ3pmaWNUMkNmSHIrUVZZUTZPVXNlNHc0?=
 =?utf-8?B?NzZ0TGJBMWJUb1d0YXBYZ2NpWjdZQzk4U3JpelNsK2swNVoxZGFjQkZRMmFo?=
 =?utf-8?B?akhreTRJRzBZcUVvYUtVY01PWDFIMTdLd1lZOTJnYllGS0k0Tm9uVkpncEp5?=
 =?utf-8?B?aElyWnlmaC9VSWR3c3lMREQyMUFrajloWmhZVlNJMmRyam5ST0tqS2gxY21x?=
 =?utf-8?B?amh6czRUcDZ4WFNZdkQwUVUwZDMzOTl0SFVmQkVZOXFkbEJKQnNXcUxQemVk?=
 =?utf-8?B?ZG1KM3dERjN0S0F2MUZ6bko0cVdvSFlPYnAyZThoRVUwWUxoTzRGVk9TRnlB?=
 =?utf-8?B?T2JyOWhVbkVOTzlUa1VrbkdaaE9QeTUyVXpQQ3BEZG9yU0F6SzlkOUErWk5O?=
 =?utf-8?B?bkM0NWRiTTBjTDNrWmJxekY2d0tRbkpKS2NqeE1scnh3QnNGZ01yVHZNRzl4?=
 =?utf-8?B?blNETUFBUHY4T205YkYvNndQMXJKTDZrbUxXa1RNdEM4aGRYSTBzMGxnM0pF?=
 =?utf-8?B?ZU1FWmVUUGp6S2tWZUp5Q3pjM0xPbTRMcW8zc1Btb2F3S3dhdVorekhaTm5P?=
 =?utf-8?B?QVE4V0FiVFRZR2lQWHgyNGgvQ0xnRk5jdURBVzZ4cGcwd1ZDaTF4RkdwZG05?=
 =?utf-8?B?MllhMWdGUGczMEszM3AxUGRYdXNkUU03YlBSbm9FRFRmR2VHK244Ny9tOFpJ?=
 =?utf-8?B?TytiOHJyNzNnMlM3S1BmQWVGeC9oMTE1ZFhpZmlhMXlWVVpadEVvQU8vTXRQ?=
 =?utf-8?B?bFpLbmxYejA5THovZ2xVeUdQTFZva2pieWQ4eFlKbkd4cmM2bTEvOHNpTThi?=
 =?utf-8?B?ektPSEJPTWhhWTNsWDNia0hsQWZBank2ZHoyUVh1cEhOSUNsVzdDOGZocmxt?=
 =?utf-8?B?M0U2REZxK0pRM1pDVU1jTmpEbHROcmp4Q1lRRWxjRUNHTngzTGxDVzFWWDd5?=
 =?utf-8?B?MFRvMGN2a0h2ZWt1MXpJQm1yYlVWeitRVEZBMzN4MnJ5WUVrM0cyeS9HTGk3?=
 =?utf-8?B?SnZpQlBXekJkQlhsZXRxalBjTHJ2TmtIbDVUVzNoSkdLTjBxTWEvd3hSYjNv?=
 =?utf-8?B?alhmdmZMSFA1YTR6K2pXNXM2Lzg0cmRPcVkxQW41YTJZSzJtQ3FTNzQ2SEJ3?=
 =?utf-8?B?a0dwcTFVUVBTYllYdGRoOEVDZjVTeXhDNk1JWlBuZjhaYy8yZmdEMmpPMFVR?=
 =?utf-8?B?KzdjdjIvdGlPaElNYmU2czF1bll0cGUzUE1vU0JhamgvcmJvYVdiTE1vNHNY?=
 =?utf-8?B?cEhxRHkrSDJYS2hBaTY4QTdvQUFKM1kxbFZVTFFhSnRLK1BUN2FSdWphcFNm?=
 =?utf-8?B?TjhNWEpVQVE3OE16UDZvYjVCN3BnZER0VHZjU0lTdGUwVnVYdTdFbjVTNk9I?=
 =?utf-8?B?NmdBcUxjT3lmNUdCclI0Q2lDZDdYTEQrVnRtb2wvbkdacFZRTDBnRTdvamZi?=
 =?utf-8?B?YW02NC9KRCtqajBkM0VLS0lLS2FiQXFrRlhsUU1naGpEM0FIVmFSdVkzdG9X?=
 =?utf-8?B?cnZoeVZYQlVGdHpGY1MrNDgvYlBQK04wLytpMitRSXoxQUhyL1ZFN003NUtZ?=
 =?utf-8?B?UGd4YzRNeE8zL29QTUV3OTF2VTVNNTNnTGo1ZHUxN3ArK3hqOHR5TE1CeXU3?=
 =?utf-8?B?d0tqWVpHOHBESDFEMWtlaFZudHBzRzFJSkxkRjM1WlNVZHlhMVo2VkJsa0xU?=
 =?utf-8?B?dVVGNEM2N2NIenFLajJaM1NOdXN1dGxwb0ZuTi9aSjNMejZtelZKU0o3dE45?=
 =?utf-8?B?TjVYRGVBcVZVNHFjbnRHYW05WFpsUThobHJnTGRsS3JkVTQ5NmI0R1BaTkQ1?=
 =?utf-8?B?bzBpSEpJVHVkUXovamlIb0JDS2tKOHgzTFQyMlIrZUVkcXJOa1VLSUl6dE9H?=
 =?utf-8?B?N3FVUUNmR2RZNDUveW5lMHY3TEQ4a0J5OU1xRmVGcWYwTEF3WWd0L0VrdTl4?=
 =?utf-8?B?aXc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 51250fc4-3f73-495d-0556-08ddf207db4f
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 14:22:51.6384
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W9Lfxars5mmVs5AWbGJIOKnyfQvhzOWOzA13dgPY2JtKFi6AMLwBnJxqyNt0RfyMbQ0I+/L4tTU2gdpOqyRh95x3+5/1NL1ChC0t7cu5Y3w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8638
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 12 Sep 2025 14:23:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7504

Hi Antonin,

On 9/12/25 3:56 PM, Antonin Godard wrote:
> Add a migration note on the pni-names default policy change after commit
> 9b34a810496f ("systemd: stop enabling non-standard "mac" policy when
> using the 'pni-names' DISTRO_FEATURE") in OE-Core.
> 
> Cc: Koen Kooi <koen.kooi@oss.qualcomm.com>
> Cc: Ross Burton <Ross.Burton@arm.com>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

