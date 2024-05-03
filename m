Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8792C4345F
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 15:11:29 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.102])
 by mx.groups.io with SMTP id smtpd.web11.15676.1714749083753925170
 for <docs@lists.yoctoproject.org>;
 Fri, 03 May 2024 08:11:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=gm1k/bxX;
 spf=pass (domain: cherry.de, ip: 40.107.249.102, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OT248nPdvZoia3AL1WXkYi1Yp1Q4w5Fo6ie4VJuZuGnErlqufLZp7r0VVXnloCpOrIxK3YMDlDvKV4+C3hi2HQ5vb1/x405LmKQdu7uuTi5KUlco8MFdMjCrOBte8n5mNEvOWN6ozfwgq2H2TrpJ6rllom+rlyiTrfOh3CmlrADXg7i0ZP+XyUThr38B9MT5VURTRIbOc2itLshyUrEXuEuycOZF5bM6PiuWfc7y4yccK/heS34TPH+bruyVeM/NU+Z3FJFVi7ss+eK9oHvZHCCOJ0QhTRJgiKH7v6nWY7G2jyPL8qx08QOAwv/dm7OtB+DeP/AhckdtLgvGASUK/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RJ8lVx9h3rsWIijVJCYE5al5HZ39tg+2o2TKhIk4iUg=;
 b=LZguPNJOyvA+F3Y+jzEjEDBdnMH7rnxr5tWroRYBYHui1ZtURKlcPz+mklkRi8YDOAjAtFEp+ISnaZIX6Ev5SS4JEeroQWhchvfrpw/bxs4l547cksWIpGoTRmXnk8zgxzh1OVlrR34WRW+KkXwYPw5BQr0NXSvxvQCm4Z8vhXMUudQLJSjOdQ+9lNupOKzAzgEsXZhYpxJZdaG6huoaY0E7qT6TYmN77wI/K7ut6LInUlWKKud+5NjWi1Sn2OzawzJWblK76BVYPDvibZ93nAZeUqwswhokQkiFckPdDUcRfD5hQx2Uit2yTMcHdyVqxXmmFLyo0AcE+N1sXfpzgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RJ8lVx9h3rsWIijVJCYE5al5HZ39tg+2o2TKhIk4iUg=;
 b=gm1k/bxXZdaWfnFEM+8468rSFNf9ID7Wz4sYhal+cfgFNG9MBpnekcz30miY+RnwRB/JGbn3G0z5AFIdsgJOZ4aAJjSu5Zyu+mw4oT1H7v9m7fr6g2bXDKYefT1IIiayrUeVATKkJaqOMk9E40amp9kzXGjZEo12Rp5k3aaWnLE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DB7PR04MB4842.eurprd04.prod.outlook.com (2603:10a6:10:1b::13)
 by DUZPR04MB9793.eurprd04.prod.outlook.com (2603:10a6:10:4b0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.36; Fri, 3 May
 2024 15:11:21 +0000
Received: from DB7PR04MB4842.eurprd04.prod.outlook.com
 ([fe80::ac08:df46:97bd:4ae6]) by DB7PR04MB4842.eurprd04.prod.outlook.com
 ([fe80::ac08:df46:97bd:4ae6%6]) with mapi id 15.20.7544.029; Fri, 3 May 2024
 15:11:20 +0000
Message-ID: <a73d0725-8b39-4651-a551-f01754f3667a@cherry.de>
Date: Fri, 3 May 2024 17:11:18 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] ref-manual: update releases.svg
To: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
References: <20240430212728.958058-1-michael.opdenacker@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20240430212728.958058-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0310.eurprd07.prod.outlook.com
 (2603:10a6:800:130::38) To DB7PR04MB4842.eurprd04.prod.outlook.com
 (2603:10a6:10:1b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4842:EE_|DUZPR04MB9793:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dfd3793-307e-4857-3c93-08dc6b8349bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NXN4dTAvc3JxQXhaT1JKZHliUDdXeFBxYWMxUFgyN1FoZ1pkcFJiZER3Qzlw?=
 =?utf-8?B?OEJwckN1MTl0TUhQcEZXeUZaNllnTjJReVlPbjdUd21ZL3lYY2pmSFJlcWNW?=
 =?utf-8?B?bnVJRGk1WmtCcmU3SUR1MVppZEIvTlBabUFDTm1VL3NIUEJub21UaExYZXcy?=
 =?utf-8?B?WVM3bk5jVy9oSWtLOHhPZWN4NGQyREVpRWorZk5aZHpvakVUalBZeVBPZEhI?=
 =?utf-8?B?bU9pV0d0WkdyL3JWenBqbUZ6YTR4VHRXSlZrNkFnWlJSQ3ZvNk84Z3d4alRT?=
 =?utf-8?B?eDZVeG8wclVnTXI0R0J2WUNXa2diVzl5S0RDRU9NU0JrYzV4RGRQN0FPdStt?=
 =?utf-8?B?aG1KcDJsRU9uYzltMFJsSjd1ajE1K1JTWUYzQ29YWnZSbENkcE5jbXhvckpE?=
 =?utf-8?B?bG0xRStrRkw2enU4Uldvb0NyVm01dmdMY3UwdTFDT2hFaDh3TnV4cStvZVhH?=
 =?utf-8?B?Z1MvQW05K0dZVm0vVjFFMTNSSllqZTlsenU4QkdnSFFWWlB2QldzQVRWb0J0?=
 =?utf-8?B?MjBEbWI2d0Y0QWoxY2s4NWlBSkwxckZmbUJRTDB6ZjE0V2ZiMDk1eEZXVUNv?=
 =?utf-8?B?SUtTc2FvMnpFM1FqckdpY3YvNGNGNlQvM3hzbmRocFlFa2xCSEdQNjlmQTRK?=
 =?utf-8?B?aVV5bk1Sb0cvRUEwRUovMEczbFV1c0xRdllsZEc5VzhGYlA1R2cwc0Q2Zy9l?=
 =?utf-8?B?MDFVV0VtSTUzRzhUdkhFUmowbkdtSTZQWUx4MGg1aUhUdUdGN0E0Rk5ta1R2?=
 =?utf-8?B?TjdzaFNkSGlRdXJYbThISm5HVzNlM1RzdDRHL0NscE96WENrM0had05XbWk2?=
 =?utf-8?B?eVBBdUF2MWxrSlNDL0FobU1vU2JWVktjVXFjbnJiSEJrY3B2QmVicVZWUUxM?=
 =?utf-8?B?blltYmRNdWJsRE9YSnBESVBmZEM1c3pja3o2U1R0VDBUeTh2dWhZZ1IxTlc0?=
 =?utf-8?B?K0FSMXhsK0ZRR2UrcThnZUpGb3JqdVkyS2lwRGU3bDVsd1dXb1E3OWFoU1Bl?=
 =?utf-8?B?QWl0RDRYTzhoWjJHeWtMUXgvQVFkeDFKSDdJUElBeUdyOG1KTXREMzBIYjhQ?=
 =?utf-8?B?R3RUOUR1TTJDWE5Ea1JXb2tQa3I0ajRZOVEvVk80dlh5OWJaZ1RsbjQvV1Ny?=
 =?utf-8?B?VEFzY2g2cGlFUDFzZGh6Yzl1ZXpYd3M5WjZ5bDVRM2FZSkEreFRVVUlHYVl0?=
 =?utf-8?B?SUxTdlBubVh2aGZ0VDFTRlo3L042bCs1ZjN1aXdKYTZqeWtmRTJkNC85SE5l?=
 =?utf-8?B?Ykxvc2RsRXcrWGx6RHRyVzdqMWpqZUVqVlp6elcvZUpYbnBWV3M4Skl4Mmt4?=
 =?utf-8?B?b1RQNk0rMlFpcTJuejZXdm9ER1ZYV3VrcXVpQ1FvcDRUblNCZlJMZ1VSN2Q4?=
 =?utf-8?B?b2pmUWNCZU51L2Y4RTVRWmkwZGlnRU5MOGxsV3EvZ2MwbHc1VnVOM0dLK3Nl?=
 =?utf-8?B?a1RrRmUyWE9SSnFxRHd3OGtWSFIwcWs1cDJlc3hUQnBwVE5jTHRRSmwyUU5v?=
 =?utf-8?B?WTBESk5NMGhxMHF3ZzlKNHBqc3llSDd3K0U1ayttZDlhU3JJdkR4S21MR25U?=
 =?utf-8?B?QU00ZjhxTTVJd3MvTm9CUGphWEY5anB1Z09kbnN2Z3NaeXFkd25hK3JIZGtC?=
 =?utf-8?B?aVFsMisyVnp3NHdqVFpqY3hqb2VBVlVyeUlZWnFTT0lXSGllaTM0dWl0ZU1s?=
 =?utf-8?B?ZmlLSjYzV3FxS0tubWVndjNLYk9FOFUvYXlXQkV5Z09tMGhPVndtV1lnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4842.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WXZXNXpNdGdxaVZsTjdmSm1scDBLd0pIVUJvZThWNWFKaTV1S3oxMEFHYlFY?=
 =?utf-8?B?bUlCYjBpMnk4OE8rSnpvSnVmMUxJL0ZMZFVMaU1jbnVDREFmc0VkWHlxT0JQ?=
 =?utf-8?B?bkJLb3hmdVNCcnpnSmlrZXdydGxaYkUydjBmWG9JYVlvNDlCV21BVzFzS0NL?=
 =?utf-8?B?NnlzYm5lOE50ZFRTZXpIaGNvbmpZQlZybENZaTdXQXphbFYwMXV2R09mZVht?=
 =?utf-8?B?cWNCZ3lLNmltRENaYTB3VitHc0pmbEJTUHlEVFdaYW50RmxCTEwrQURaU0Jh?=
 =?utf-8?B?RGNMQUY2OERnZUJ3TmE2VGxhbWVGd0prVGZNc1JCcEhPYUlPQVhXTWJXR0VC?=
 =?utf-8?B?T0cxV2kvT0Z2WGZ1eXB6QnVVVGZ4UytUVEtzaEg2amw4T1hUQS81NWwrWFdK?=
 =?utf-8?B?Qi9tRnZXM2RsSHBTdGkyN2ZtOVVTeHpKOHJPNGxGS1YwVXd3Y25yL1FWdFNN?=
 =?utf-8?B?VnRmeGlCVk80ZU10MlFwV1FFVUlqT2ppMkpEVFQ5dUM0SGxMNXBhM3JnbEdl?=
 =?utf-8?B?M0dveW95QTlVNHB2WDZ4cnF2TVgrRGR5QWc1T2RwWGZsMjdZNmtqeUE0a25t?=
 =?utf-8?B?VFpuT09OeWJiQ2thbEd1aWwzME1aNldoQjMyK3pYWC9uMlpmVGcvYjhFbTZZ?=
 =?utf-8?B?SHRXS0FkR3dOLzV6NUkwZGcrbm5HTkhiQkVEVlBmeFdvWXQxUUZOV3g5Z01L?=
 =?utf-8?B?S1BWUVJUcXcwQzJmajA5OE0xR21ocmxSMng5NmJnWG55WTdTN05OejA0Y1pI?=
 =?utf-8?B?SWp5bDZEOTJVaGNEZDVOZkVkNTljcCtqOEorZmZCUmRLNGxLQ0NsdFZSVCtq?=
 =?utf-8?B?YWREakdxdCtVb0RvWUdSSHpWYnZXUkY4YmpLeVVDaXQvY1JFS1oyWW9MZHRX?=
 =?utf-8?B?bVZmZjdLR29SdU8vdElkVGw2b0dXcUh1c09SaUY5SVJoMk15a25hNWlDdkZQ?=
 =?utf-8?B?eTRWWXpTNjBIRHVpMjduZFptWS9hTHF4d0N0NURSTkFxYWpaVHpNR1F3eWlE?=
 =?utf-8?B?YXJiTFAzQTd6RTl6NnFUd3Ftd3cxU2JZUW1neFdhNXAvNUNjcWQ4b1pETXJk?=
 =?utf-8?B?ekJ1UUV5QUJBSk9ReFR5eGJiTC96YzErTkpoK3RnTmo0aml6L01BQWVvbWdV?=
 =?utf-8?B?N0VoaVRIN1lyN3EzdUdMU2ttdTIyTWRRK1Q5ampkWDZ3UWR3Uk5nd3NZSDlL?=
 =?utf-8?B?c05STkFZTkJQejNGMFlLRitEQzNvalJwWm0zVElWUFlBSkNxQU5nQk1vVWJU?=
 =?utf-8?B?TXAydGEzRmNWNkM2aG5CZXlmek1LUDZ0QTd2bDZrRC8zQnNwWFFnT1Q5Q2Jk?=
 =?utf-8?B?QjUwemZvV1B1UURMZnJvVUpaZUgxYkMyak1vRGw4b1pzOXA4MXhhUUFCZ1I1?=
 =?utf-8?B?bCtnZXVVcmd2UWx6dDNEWGZjRzZXZGkwTURYMlc1aVVFbngwZ1VOMXlhMUhN?=
 =?utf-8?B?OHNPbnNhaUM2WWJrUllTRGNiZ3ZpMG40RjJycVpYdmV0RkpiQ1dqMTdiSEQx?=
 =?utf-8?B?MHVSVWR1eWFNeGNhYTB0eVlpZ25ZaGNCTWRaOUNpV0RCN1V3cWw0VnVtaFo0?=
 =?utf-8?B?WE0yKzJUaVhzZkJvZzd5c1QwaEsrQ2I5RjNPTnNVb09CNUQ2TTNWYWJvYURL?=
 =?utf-8?B?ZVlkZ3VabE04MTFpT2NvWi9WOHpHZnJUNkhaOVBtS1UzeXlKY2hZMTR5WW9W?=
 =?utf-8?B?L3hWRnFYMzRBUHkwLzVIcUd0R3V0NWpJVlFMVGZVR1A5OFNyWVY2aUhRWWEx?=
 =?utf-8?B?djZRTE51L3Z6dmhJZXBEV2txWXhwZzM4cXN5K1liVS9iUVREcHlDYzhnRnh1?=
 =?utf-8?B?OVpWVFc2Z013a25VZkUzOCtPY205WHpSMGdkRzUyU05TRVJPZXNtTE5Dc2Jo?=
 =?utf-8?B?d3Zkd0JuS0Nva3pqY3Z4c0lQRW5Bcnk2eXoxZ0xQNTJvS3psWnp4YTN4VHMy?=
 =?utf-8?B?a0lETFR6WjJCNXBHWUtBaWxNaVBWaWR6WTIyYlJoUENlS3Z2K1FKM2R5MjJj?=
 =?utf-8?B?ajBtYllEdXRRQ0lrRTJkVEIvekpHUlFDT0Rwa2tKM1pCRXFNWHNmSEh0SG0r?=
 =?utf-8?B?QnI5RVZwU3pHQzN5TUFtSjJQU21rSjBFYURnWmhjR0NONE1zMnRjWStLUFBT?=
 =?utf-8?B?bks1U1hRZ2NreTJrdERkUTY5ang5MmwyUittNGFSbzAxdXpycG04YzkzRjht?=
 =?utf-8?B?V3c9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dfd3793-307e-4857-3c93-08dc6b8349bd
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4842.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2024 15:11:20.4483
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gMk6XczavXQ+fxELOv4D6R4PmDvPFg/redD+4SK2c2+53HGdTrPcxZo00dj/M3hdRkf1Q6GaRqSdAE/SdVqNVkmbTxBnCuqfR3pnWvH5p1g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9793
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 03 May 2024 15:11:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5213

Hi Michael,

On 4/30/24 11:27 PM, Michael Opdenacker via lists.yoctoproject.org wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> 
> - Make Scarthgap a current release
> - Add Styhead
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Had a random idea though, don't know if it's any good, but what about 
highlighting (or rather the opposite) EoL releases? I assume this may be 
an issue if we don't update the releases.svg from earlier/EoL releases.

Thanks!
Quentin

