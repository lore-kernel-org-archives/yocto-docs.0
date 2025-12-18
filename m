Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08F87D6E2AD
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 15:50:56 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45419.1766073045630139408
 for <docs@lists.yoctoproject.org>;
 Thu, 18 Dec 2025 07:50:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=ZUh+KhYy;
 spf=pass (domain: cherry.de, ip: 40.107.162.64, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d002cJV+3NGGVTYJhZQVTO6kOZLI83zFxrm6FHZcP5xClXt07ALqKTPMDeB/DC76QRXpMJoWJK8MpCprX2D9eE3g/7qxqGPtbHQoX6K4qxdynD8qtiKWYbTRtp9Gmew+fM5O+giH5vadVAizAC1BSwZahGtke/K9rfO2KM4JO4+IDm0Z8WhK/VgOLCubYTQwj578eRBzZc2aFl1l69H0B/nmjBslydNRnkjPgy/vJZ7CUl6lOtKgC2zMRiX1+19FSuY0oIFZcZhSBZKtQPpB8KAzQ+dbJ/gWdrl+SB/tkj3zj+zW8w/RZWXLU+52oRMmQ5XmNj4fPYgHHPlvqoS0Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QZmJ9Q9TNVZ7q7THvxGBvtzBausnxJp4Zbg9AmtwhgQ=;
 b=bOsTRVdUeBargmm6xwFRigTLP7avWo1N3KP3DqO8BWXg394lZNboPprSXUfr9c4XGWDINwqZ2P92c3Af8Io2BvI8r0ME47OHzsqmZJEIlilHGbLCwLFzJF9tFmzLGjq25JJpxyUVOU/zqJ/btSL7/mDx36kKHrm6Cv95vBxcPbQJmy5b5RengjyhEJ8ZaBKVFr405Pljpy4+R5E6cLlZFKlj+ss+eg7jTzlZR6IbylwVJSbQORJdthIraGLqUFlU+vRCcLXg9LMuFV3YUMTB613CvmXszpsesxlHWObpFFU9AEBmsrx0zK7ui8HMo/FAAcHr2Loinox/QRxPfbklug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QZmJ9Q9TNVZ7q7THvxGBvtzBausnxJp4Zbg9AmtwhgQ=;
 b=ZUh+KhYyLDrUPn7E1T9Znn6Xkt4IFGdJqTVmI7NV5AirvIVgmrMK/MA5elxGQHdN1gpm7c4s10kH6lalo1oc3Yls3iA5L+oIMnII3ZHTawbTSYZMMtOigaSdJ8QZhJYvbxSb01YHy13btLbqTNdtGbR6JrpyUX/suI9oK8kw7Ns=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by AS8PR04MB8674.eurprd04.prod.outlook.com (2603:10a6:20b:429::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.7; Thu, 18 Dec
 2025 15:50:30 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 15:50:30 +0000
Message-ID: <367af9f7-fac7-4120-ba9d-45f03ee73137@cherry.de>
Date: Thu, 18 Dec 2025 16:50:29 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Add the sphinx-copybutton extension
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251218-sphinx-copybutton-v1-1-752b7c4ff8f9@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251218-sphinx-copybutton-v1-1-752b7c4ff8f9@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR3P281CA0065.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::20) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|AS8PR04MB8674:EE_
X-MS-Office365-Filtering-Correlation-Id: a3df0f12-98c2-426e-ded2-08de3e4d2be7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NVFUdXljZkFjNkpZRlZTWU9OMlM4NlMxcWFjYUtYS3ZhM3NwY0wyc1dxYlkw?=
 =?utf-8?B?bUkyUzZTQzJydDZuSGg2V0c3cmYvRjhzNi9jZUJSbEtKekZkU09ZcytJQVph?=
 =?utf-8?B?T3VRMUwxajBOWWtycGpSZGNMK2VSUzcxVFhRd1VQdmRsbytESURCZ2txaVB5?=
 =?utf-8?B?K0VtdGwybzJNeFFQZi9QbG9mSllsZENMTmJwOEF6bk1udnkyemRBdWc0MVhC?=
 =?utf-8?B?ekcwckxxV1VjbDRsT0NocGlWU0hENzZTTFlWbXpsRWwyaTlPMnFXZWgxTnp2?=
 =?utf-8?B?cjREd2hER1QwRDNRYnZEM2lBS212d05HYndHSFZMNHJhNm5FcTdKZStXaFNW?=
 =?utf-8?B?UnorRGhqNWNnc0pyWFFRYU9SVUw0SElDTGI3VjRaMGI3TVU2SmlEb25iWkZa?=
 =?utf-8?B?c2h5K3BkcktRTW9xREJadVN3OWZjWm1DK05yVnBGU0lCOUVua083bzcrSGNV?=
 =?utf-8?B?NTZMcEtJNE9nZlFMakpGN1ZjUFZvOXgxbHBad3ZLUW9ib0dPK0hJUXgrUHZp?=
 =?utf-8?B?Z1NVZmFRcy9GQjdhMmF5c2oxSCtad3ZVN1FwUDRQNnpXTjZVNTIvdVVQN2Zv?=
 =?utf-8?B?M1paVjVRVVlLUnR0VzNQdnBqTHloeWs5aHc5NHJRQkdwWi92YitOU25hWmR6?=
 =?utf-8?B?b2o2OFhhTUtuWFViOXVSS3U3VEJpdjFBUWFPbmdjMFlBRWdyNXpXV0NQUlYr?=
 =?utf-8?B?OEJobmdlQVhzS0RvMmcvWXlsVEc4cWh4bmw3OTQ0cThSUHlDaDlWQlpTV29y?=
 =?utf-8?B?SVduc2tydXFpZWtqZ2tLSkxSaEh1UVNGcW5hdVpVQWY0b2FYZ2pHcU5IN3Qx?=
 =?utf-8?B?ZjZVN0V3QmoxeGxSRnhVVllBdHcreWdhaGVRQzFxZFB5cllaakRlQnNtNjVl?=
 =?utf-8?B?RWpvL1R2NUJ3YSsxbytNamtmdHpaUkk0aWxwck50aVg0enNHY3FzZWtJNW1Q?=
 =?utf-8?B?M2NkSUNnTWFHZ3BnR0ZPOGw1RDJUWkQwN3VoQ0RqeUdsSk85aVNCanhEQk05?=
 =?utf-8?B?MDZMSmF6bEdMV0xFQVdXRllkcTFGdFFlZnFwYmN0WHhIWnB2Qk5LcVdQQWpi?=
 =?utf-8?B?b1FJNEt4RitHenhvVWF3UXJ4YzdLWDZQK3dJL1R4QnRjanhUcEZNdnJFVW9N?=
 =?utf-8?B?NHBwT2dyZXVya2wrT0dudmNBSllwVklyTDltREQyaUNybTlNOVpDZ0JIMWJs?=
 =?utf-8?B?eHh1RHNLbnBLbGlYTzF1TnFXL0hiRitrNUFndFE0UDJQRmh5cTdFOEVaRy9t?=
 =?utf-8?B?dkZOcXR0Rkw5cm1Jd2Z1bmNTa3AxNWxGck9MQ2FXYTFYK3NFY3g5Y3p2MGpB?=
 =?utf-8?B?TnRpS2tuUE9pYWdJYXk5NGlzQk13L0NWd2J4dFh6V1JDOVlvSXNkcU5JUG5i?=
 =?utf-8?B?UW5VZC8vazJpajVRTU5COXg3SlFDZkdvUEZpU1hQRWh6azBORzdiWXJ0NHRM?=
 =?utf-8?B?TGt5clpZVllKejBNYStlRjRXL1BmbHExelhqTjA4RS9uZVl1OFlzOEpFQlNr?=
 =?utf-8?B?dWZNeU5WeFJzSWZhUjhnU3p1c0s3bEs4b3hsNHZNNXowY0pLVFVEYnJqbHZX?=
 =?utf-8?B?MVN3TDNNQWdrWVpHajFpSnhNT255QzdtakpKZ1lEYVFNT0hIb2g1WHJSUCtM?=
 =?utf-8?B?UmNXVC9zRUxDVndlM09iNVZ0ekswUU5xZ1VTL1M3TjVkbWc2Qk5VRUNRNm5z?=
 =?utf-8?B?OFlEN0tpeDArbG53VHFmYnpMNGRNclBrVUkwa3RpYk9JUWk3My94ZE5pbklF?=
 =?utf-8?B?bHR5Z1NyajNXL0ZJWDBETTZudnR3Tm9sT0JRQnNGNUNhTENVQkZ2aWVYQlM1?=
 =?utf-8?B?QkdVS3Y4VmFGZzF3Vm41ZENtY3VBV3MzS2QrS1BhNnVtYmIyU3ZhMFpSejVz?=
 =?utf-8?B?bXJFQ2pyVExQV1FBVWUwOG83dER3dWJsWXowanVweDFiWmc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?c3RmbE5JRUJ2T1NFMGI1V1B1OFpsQlhHSXh2aElQMitzSm5TcC9XVEt3bzlt?=
 =?utf-8?B?Q0NxM05OMlhoaGdvNE1aU2NLZ3BtQWE3ODMzMUJTcnB1T3J4eWR2aGlJMVZO?=
 =?utf-8?B?TTNiSDZhN0s1cW9Nb2xtcjRhVFdDS1VBbzVXNVVrTDZyMnZqRDRDeXRVcTBm?=
 =?utf-8?B?SDd5SzQrMEVMSFplMjFsRUZDcFhDMkVBcTUvUndUdVY5RlBwYnBYZzF4WGw4?=
 =?utf-8?B?V1BERGkwTXhRT3lvd2pZUnZyV2RHSEZkeHZSNXZOeThuR0dENUVmN3RxOStW?=
 =?utf-8?B?Zm8vWnYwN0x3bFhQUTBiQ0ZrZDlCVTlkeko4cjNkd00vZmh1dXRybG1kT1hK?=
 =?utf-8?B?YjZnb3hySnNuSk1iK0dzUzZWYzNtanErWmFjV1JWVWcxNmFiTzZva29PaERL?=
 =?utf-8?B?S0Fka0gzSGRpZnRLUnZnZlgvWXNzZXJ0U3lsQTFMNVVNWlhISTZGQnZnVEgw?=
 =?utf-8?B?OW5MR0hIZUVZZlpLenlXTWhRcHB3YWpmYURNRFVvcTFjWjhXQ1FSQkxyazh0?=
 =?utf-8?B?R2JKeDlHM3k5T3NYNFJvL3dzUld4Rm56ODRXNVozbkZuZzNHdm84V0N2Y2ls?=
 =?utf-8?B?aitEczRNcUZZK3NCbUMyTVNhYUZYK2NPY0gwQ1pwWVJRREtCRW5pU1VOSmhR?=
 =?utf-8?B?Zk1IMkhiaDUxVENGSmVDTFVlQjdrODd3KzMzeHBCVE5DK2JhQlNUOEFHUmpR?=
 =?utf-8?B?MmlCU1poYWhPVDBacHAvbFJMb0RJOCtjNXJ6aHNjMnYyMll6cGlBQVhNY0pU?=
 =?utf-8?B?eUZiaHpGSFFIY0RTM3JWYmprWTVjUjBNTmcvQW1mUXlwMmt0dDZsbG1OSnl3?=
 =?utf-8?B?bHR3V094SHVkQ0VlVnZYMHFvVWUzUFJSLzZHTW42aHFQQit1Yk1FVGp3TmVR?=
 =?utf-8?B?ZmI3aDNnbzZYOHE4ZitXditpNHd6MzZUSWxhSEw4QVRRSzVNWFpxVHQvemZG?=
 =?utf-8?B?UldkSnI5dENkOFdFKy9pdUcvUUZGWXVJOGU0RzJEQkVLcS95STVKNkRDMW84?=
 =?utf-8?B?aFZIaERibFpNcExVWEgydDZ3cDZ3THlYd0tOL3VicklnS0xSZVNsTlpqbTc1?=
 =?utf-8?B?VnBnTGd2NENTMUZjSk1zeGt0UWlLQmZTQnNtM0tyczY1Ykd6c213MzgxTVFL?=
 =?utf-8?B?TzFIZE1ZRlBPK2dpZ3h3SU9xUURJYXhvMmVJZ2VVMnpnVFczeTd2akZ4aGpS?=
 =?utf-8?B?UU1CRHBRTTVVM2JHZGVQd2xVR2pUVU9JTnZFWkZaUEQ3Q291MTRBMldTL2RK?=
 =?utf-8?B?SmNDTFg4cHduKzNDQU15SjdQQnNzZlJUZ0pKaGFObWhaV3RYYnhJbVA3QmR0?=
 =?utf-8?B?YmdkWVFsaVczTW1NL20yRWtqNjh0RUJOVFFDV2xWVjgzdTVsbTkwZHZDTzdW?=
 =?utf-8?B?cm1XaC9SUk8yL0NsRkN5b0Z3WHVQUUMxNEJoc0ZkUlZybHUxT2ZpdS91eUZU?=
 =?utf-8?B?ZWlnd2dGL0c2K3crTC9SaElFZmQzTWtxNGZPKzh3SlROWk5EOThjeVZpeTRT?=
 =?utf-8?B?WWliNHpwaUxybkhmREROZFE1V3hyZU93VUJTVks5eUthZXY1MjZiU09NaUFt?=
 =?utf-8?B?TDU3RjU0Tk1FU1YzOU41aXlmUUNtdGNBVmdPaU1pd2l1c2d2ZmNza2dPZEQ4?=
 =?utf-8?B?QnZCMkVobTRMaUQ3M1dIUXZXZXd1MDk0L2tnR0RKNW9ydW9rMjdGOVhDYjRw?=
 =?utf-8?B?VExMQUV4dlFwV0EvdGgvZWZqQW9oaDM5TjFHQ0pGTE1hTUZESzJ4QWZlUzVP?=
 =?utf-8?B?SThYVHJhazYwdC81enIzOXVnQUxEaUNwWE9QZEt4UnZKejNxVHF5OXZTNzdN?=
 =?utf-8?B?cFlvZGRqY3crcmlhZFFQSGdpbktXREh6TDJhamFoYW9WdEgxZUY1QWV6RTBz?=
 =?utf-8?B?Z0puaS9EWlFXTFZkZ2MyM3RXbW05eU5OUmdmRVVUUVNQdDZoZlpEV014Z1Nz?=
 =?utf-8?B?M1pRQzVFZmZnRjRMVGRRMzlIOWNPblBZQm1RRmFJelB5WHNTRHZ1K2hWTWls?=
 =?utf-8?B?MDJBMXUzVmE4OFNYdWltSEpROXNHeEtoWE5BME5CQVFnRS8raGNSYlBKeWJS?=
 =?utf-8?B?MUxLQXRGUEFqc2lISnE1UzRDQm5sU2hJY3JQY29HSkJTU0VLZ3FKYmFQTFMr?=
 =?utf-8?B?YllteWF2OGRqOUFiY3VjdUNhQ2xVd1cwTXZ5VUtwVXltTnpCbUtWMDM1YzNm?=
 =?utf-8?B?NHc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: a3df0f12-98c2-426e-ded2-08de3e4d2be7
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 15:50:30.4314
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EN6Dd1nLCqC8TrWOc3+ljLP3aPoJvaAP0+M04C7keP/Aiad7Dd0lhlMdzDmwbA+g1cGGB+XRNuqM9J9uNrBN9cO0KUmLlOw3xl6Jk5oER70=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8674
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 18 Dec 2025 15:50:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8304

Hi Antonin,

On 12/18/25 10:44 AM, Antonin Godard wrote:
> This extension adds a copy button to code-blocks.
> 
> It was added to the buildtools tarballs for documentation with
> commit ebf14a6dc1a5 ("python3-sphinx-copybutton: add recipe") in
> OE-Core, so the the Autobuilder can use it.
> 
> Add it as a requirement in the docs, including in Ubuntu requirements.
> According to https://pkgs.org/download/python3-sphinx-copybutton this
> packages is provided under "python3-sphinx-copybutton" on all the
> versions of Ubuntu we support.
> 

Not enough sadly.

Go to 
yocto-docs/documentation/_build/html/ref-manual/terms.html#term-Build-Directory 
and click the copy button. It'll copy the $ as well, and it shouldn't. 
First, I believe those code blocks should be console and not shell (or 
shell but we remove $ in front). Note that some file have their 
highlight language changed to shell, c.f. the toaster files, so a simple 
grep will not return everything that needs to be changed.

Second, we may need to configure copybutton, e.g. 
https://sphinx-copybutton.readthedocs.io/en/latest/use.html#strip-and-configure-input-prompts-for-code-cells 
at the very least I guess.

FYI on Fedora, I believe we should be able to use packages from the 
package feed for all docs since f41 (but since we say we still support 
f39 and f40, not applicable right now).

Cheers,
Quentin

