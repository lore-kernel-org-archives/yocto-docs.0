Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74D2BC02182
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 14:19:11 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.45])
 by mx.groups.io with SMTP id smtpd.web11.11582.1737641941364172312
 for <docs@lists.yoctoproject.org>;
 Thu, 23 Jan 2025 06:19:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=fg7GzIoq;
 spf=pass (domain: cherry.de, ip: 40.107.247.45, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IRll8poTc8lFK6D76z1GlN5Sjq4qmIDwqs7a8haZdvp8UyICYQzzx4KrBvfC7aMHLNWUA5VYY6rOVF8+6JgtH0CHTdGCeZcvAPaSEBs9pvofO6yTzGZp0V9nSnvMxbpIYD4ICp3ZTePM2OQb0Ib7oImAX89iAZemZX3bgiUK8VZVIl8R5zvkDdGCa66/n3P2RIiUo6say9gg0hmMJ/rXFQpsPmyVEE0S6TvHqvnAcNpMQFl56sPxVq479YWXAGCcSZymZdfY+jRvuJrVY2ZBRQIf/dFniUMaCyu1IdnkP8r92AwlYWodUoGfj7wOM3tnF0u8+OeuNMg+etbEKWszZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+IgkTgQUqjjeTqVuM3gfJ8kEO/x6TszwFHMFZ61HgXA=;
 b=q7QVGdX9iMFgs3D+PPrBFdIlqXvbsx3rSCcijRzJJRn+4RlXqoAZZi7VKSDT1BFQkSscrwFJitxiR/T77Tb8H6PM+nIzzfkr2ZEby8F9l4QMUtipLvJmT8Ndy33wqsbvNwJUCMtMZLXITOR5iYzl0/O1g/y+PzsqrQFQYL+u9XWympS2ysL1YauwE3c7VlFamgEp83UdfHYrlXg5g4sYfYNUy838HREyCuT0drmVSNYbSGGZGsVzSIsMX3NWz5cPLhbklIuBqT0em3fhCY37Zp0EOfoGz4xFBFhMKnVSSDhf6i/tGxDKOVMph3PLjG2vNGOEvS+ezpZ+3cwG6OlHfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+IgkTgQUqjjeTqVuM3gfJ8kEO/x6TszwFHMFZ61HgXA=;
 b=fg7GzIoqzqix9fowKRun23k+uD1Vd9KCnOcGMLkyfYIUCaWqrIzpt/ELXiEuXp/SX+o0bPuuEUBPpQjYG5kNcRJ5mGkETnM7tQEQEMrQ5XbsnoTJJVbL5jUWtsW1B9mSVjJiGUl02kDn1mbc80KWcJI7oOp8PV/TWPHjYLNjulo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by GVXPR04MB10183.eurprd04.prod.outlook.com (2603:10a6:150:1c1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.17; Thu, 23 Jan
 2025 14:18:55 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%5]) with mapi id 15.20.8356.020; Thu, 23 Jan 2025
 14:18:55 +0000
Message-ID: <d8c1900c-d1a7-43a4-829e-b660ca5999fd@cherry.de>
Date: Thu, 23 Jan 2025 15:18:55 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [yocto-docs][PATCH] test-manual/ptest: link to common framework
 ptest classes
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250117-ptest-common-classes-v1-1-043c7fd46da5@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250117-ptest-common-classes-v1-1-043c7fd46da5@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0011.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::21)
 To AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|GVXPR04MB10183:EE_
X-MS-Office365-Filtering-Correlation-Id: c0e9e3be-8d7e-4396-0643-08dd3bb8dee7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?S2tsOENNdGw1ZlBUNTNTclFvb1VZYm5SendXejZKbFd6UFpvL1BiK2Z5QlJC?=
 =?utf-8?B?VXlCWW1CTnRtZzZpVnZwbldIRGFWUDd1UGpOREx1RkFialpORlpodGRPTzJU?=
 =?utf-8?B?MnJsUzdndkdQeFBpSHJkU2tWdThycTBYZncyNE84NWRDUmVtL3BpK2xyZ2ZT?=
 =?utf-8?B?YnBHRGhPR3NWNks5cUZiT3pmNno2L0NNNCtreXptdDBNbGY4VWtXTW4vOXhH?=
 =?utf-8?B?YUg5WnJxVE9GV2p1NllJUGoxOUhnVWJjTGRrMC9RSXRFM3Z5MFVndXNIc2hL?=
 =?utf-8?B?MlRhcHVkd1orMGpYVEc3SU8xbGFlVys3WVFKcnQ1SWZLY3VQNFlhUEZiTjJY?=
 =?utf-8?B?S3ZMWU9pTjlaeXJ2VGQ5TVhjNlhOTGVMc2JTUkh3eCtuVlFRZ0xmSlM3ZHFX?=
 =?utf-8?B?UENmM0xlaXZJK1dUT0dXd1BPcUZhNWV6M1ZScGtsUHpyOXBVQ3BOUzU5RXRv?=
 =?utf-8?B?S2c1bUNMd1NrU09mbDZJQnJUNXFDNE4xSmlwYXNQNGVPdTZQcTUyNGlCdWFv?=
 =?utf-8?B?V0x0S0E4OGowSGtSNWxnQThoME5ZS3pjL3NrWE1ob2RUOHp5dVBhdzRCeEt2?=
 =?utf-8?B?UGhFRkNQNHRvcTVLRkcyYnBaTlhGZXZnTC81N0xxYTFzeGh6UEtTQ3NxTmRP?=
 =?utf-8?B?QjFzRlNqWjIvS3hDQk5LWHZhSDlnVmFCOHhnMGJjeWZaK2YzMFZXVm5Nengz?=
 =?utf-8?B?Q081NklUQWFjdHFpT1ZFMmZIcStwUGUvZlF5WEFFTStqeGd0K20wdzI1VzhM?=
 =?utf-8?B?aHVTQnIrTHpCQWorSDNYeEk3bVFxUk10SUNPV29SbFNRbHBHZmdidlR2cTB3?=
 =?utf-8?B?b0JzOGFlVnhhYzJvNnZ3NUhCWjZVRDlKQ2tuTWpuL2h5NFp0RHY0bVZLMnVR?=
 =?utf-8?B?NWVjMS8yRjBweWJJa3hBVXVaK2x2QlpJZWtneTk1bWZuL0ZIOHhQWUMwY3FI?=
 =?utf-8?B?SDZpWmQ4d2RXVVNaQ1hNeXNsUXpRdmV6SHh6Wko1Y2tRMjc4bmMyOTZYcGxN?=
 =?utf-8?B?S3dsbkdjOTZOb3FVc3A1dUxXaUducnF6bkU2cXV3ekFMTW15VWZFYXhZYmpE?=
 =?utf-8?B?Yi9xR0c2WVFycm1Kd0VxNmVQTW9iU1FrTjlTRlJaUzdwZ0Y1dWdQMWh5VjFP?=
 =?utf-8?B?YnBKMEV1YzdkTXRWMUJseVI2RUJCWkVjQnljb2RBaDdrdGxLa3ZTRFg1UnFo?=
 =?utf-8?B?VUNzWG9tWk9qMUNSMEVqUWthSUZzVllaazgvTUl2bEp1OWZjbFFUdkNWaWV4?=
 =?utf-8?B?TktLTnZGb2Jqenduay8vTE5TRFk1N1F4TGhJOUtiamhNbmNwRDhtQW1kMkJr?=
 =?utf-8?B?NU1rdFR5WEtLVFd6c2luWjd2SXNXcjdsUDZYT3pQL1N0YXIwdVZyWVR3b3VG?=
 =?utf-8?B?Q0M2M1VvWmlmYklDOGVBQTVjcDlhS2ZzUEo4dHZLWE9sNEwxQXBaRkJQcmFi?=
 =?utf-8?B?T0x1cGNOTkhLTHluc0Q1T1QrVlBWbEZ6QktJVVZYejBJMU9JbFVRTTJkaUJa?=
 =?utf-8?B?WXZVL2tPK3BDM2h4eUxrL3VoY3BPVlVpYVpmWjVNa3pEMjhtMVpPV2lWSVUx?=
 =?utf-8?B?eFVoWGZRM0FZcDRLMUN1cVl6dVRCbE1wZEJsSCttaXd6OEtCaVVtWDVuVnhN?=
 =?utf-8?B?V0UxZ3c1SUhDRENhUWtseldSclYxcnY1bmlMQlFDVzE4UTBDRVZPMHRrVHQ5?=
 =?utf-8?B?VzBacnp5VCthNGJYVStsTEphaFhVMGhHVCtoNkxUdGxuVElkUXhvY1plUjFD?=
 =?utf-8?B?QWxza1YzTEw1UnBVdmRBOWRON2VHVnhoS0I2RjJIRjZ6N2ZZQ0JtQVVwUGZH?=
 =?utf-8?B?aFBlQy94ZmFxckROY0gyTFQwQ0hRTlBaK3VXZXc5NktIU1Qza3RRRGlxSVRr?=
 =?utf-8?Q?agy0eAOGqyiEN?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?R2l2WWlyRTNjdXlJb2FDZVllbFNjNStDRWFiUFZhVlpFdmRkOGxncUpvVHlr?=
 =?utf-8?B?VTlwOVAzbHl0NVZUR2J0QXZ6TldoMktBYjlja1QrZU5HaFlrRU5NVGNVeGNz?=
 =?utf-8?B?VWtGYjBQTE1kR2E4N2MweWRIM1M0Rk5LVi9vYitwOVhHTkdZR0ZHZHlXMWxS?=
 =?utf-8?B?Vm5hZk0waXNZK3A1dlJRTFBsOXp6OUVkdkVjY3dsRWRNMUFYemlOQVFTN0VL?=
 =?utf-8?B?NlRsY3piMHhNbVlXcVpJOFVLcm5UcWpkK1VHUk5KSmMzZEQ3bHl6OUNjUlJv?=
 =?utf-8?B?QkVobzQvTDY0Qzl6c1ZLSDBIN25qQ0xZOFU1WWk0Q0h0elloZU4zWHFwTWdO?=
 =?utf-8?B?OEdWY05HMlQ5WkJLWDdrRlNTYVZRcHVNR1EzdFFaMDVRNGxJbWI5OVhEYkFU?=
 =?utf-8?B?RG9nYm9VNVJySkZ4TC9FaTlBc1kxUm1BTUdqUGk0dllIK3l0b3NjbEZ4MHlN?=
 =?utf-8?B?TEtuR1Yzb0habHlaYkx0WW50bXdqQWsrTVRaVXlDYjY1RExUbEx6R2JVZG9T?=
 =?utf-8?B?cUFiZStNMkk1ZjVQRm5qRXRnRmtwYXZsenJNbTNpNzhpUXVlR1g1THJVQmtR?=
 =?utf-8?B?dTRrWlB5eWZBNGhpdERMaTFzZTJCU1BMUWNmVDNPOFdKWFZaZkRBVUlrOGt0?=
 =?utf-8?B?Z0g3a2RhNDN3VW5qSXJhTGZieTJzNkRja2F0cXRMY1NFYjRMREJib041TUx1?=
 =?utf-8?B?SnlOUE1CS3I4aEo2OXBFUmduTE5ycXpzaDQ5QW90aHJWYzBKZDhlbEtkQTlT?=
 =?utf-8?B?VEFIdnZpZVZETS9BaFo5T2FBNlNGWG1rMHoxdkEzNzh3MEdoNkZ6ZzQwQksz?=
 =?utf-8?B?aFVmcGljdDNCWUpjNWJjK0NiVEU3MFhKYTFjNEVmRmwzYTJuYjNaN0M4TXIz?=
 =?utf-8?B?ajVIZmtwTFErR2lweVdYM3pHV2dNekJuSjZnekhsSjBJRStBTHFxakRnTzdz?=
 =?utf-8?B?dVVtUTBLV0F6SitzL3pQODRGTGNORWp2Z2YyOGhXZS9WSzBSNXFpN0ZVSXIw?=
 =?utf-8?B?ZmErWTMzL0FxZEFUZXl5S0tIaDB1dnNzMEJ6ZDFJQ0Z6NEsxZC8rRmk4aW96?=
 =?utf-8?B?ZmVrNVI5amk0d2xBTnNzOHB0bnVqUUZOcXZ3ejh5WWNMTU4yYVVJT0dzaGcx?=
 =?utf-8?B?TDV4OWFoZ25xTWs4bHhlU0JkbEZaZExpWmdCTWhlYkxOUWl2dWwrSWo5Nlgz?=
 =?utf-8?B?SktwQnRBeDNyM29vc1diUnovbVFZNVZWcUNiYTk3ME5EUEt5bG9OVTlybytZ?=
 =?utf-8?B?cUNFazBYVmx2YjlDdXM5QXBtWllkbVRPUTZ1K0ZLYzArUmIxL09iTUh3bktX?=
 =?utf-8?B?b2hFQmdQV1BKNUhJZWxDSVdDdXFzVkFWek4wM0dmUWJsTlBFTHdMeHVKRzh1?=
 =?utf-8?B?UXU1engwZUVQdnNuYXptUnJRdmhYbHltYUVwdjJXSStkN0ZhQ3NDdlN1N3Bk?=
 =?utf-8?B?ZElRYlRRdVA2WWkzMmFUQXlmU1VCbk4xamFFWDVMYlV3c21hTE5zL09PbHQv?=
 =?utf-8?B?SUJucGRoRkplUWVnSXJuOGQrNXhWZ3Mya3UrMk5ZdSs5RC9vN2dHMjB1bWda?=
 =?utf-8?B?Yk5OQ21QVmlORVlCU0xCRDgyY1JxKzRES2EvSXFld0Rxcyt3ZzQ0RWI2V3Q5?=
 =?utf-8?B?YW5uY085aTNLUmVoU3I2bW1TZDlDNjRkdlBBdW4xVlBscnhNR1Y0RjZGcEdu?=
 =?utf-8?B?YldCZ1loTGEwKzZ3L1FVQlZMVkRxcWJTUlB6Z1dVMmtRckEwM3VhVEFDSVpu?=
 =?utf-8?B?WTAyL3haQXJVYW03VmgrSUJVbkM1emN2VWVpZVZ1WXNWWmJQVWlmMkNDSjh6?=
 =?utf-8?B?aFNCc3NtM3ErWDMyS3ROZmROMFZqNXkydWhBY3pTMUNNQlhqeHlkblhzWVBM?=
 =?utf-8?B?OHZ4eUxUMXNCRjFWeDcreWdEekdVSlRSdm02RUI3anM4U1hoWjE3amQzcUps?=
 =?utf-8?B?NHY0cWI5SG9CRGFHNW9rRDU2VGRYNTREVXlhV1V3QzUzUmpHQ01XQVkrZXlW?=
 =?utf-8?B?WTNUb3RoT21sOXNKNkdpT0RKUVBseFk5TldsUHowVTk3SCtOMll2NXhIMHlP?=
 =?utf-8?B?aWRDUCtrUFdiR0d1OWZyazZDb0poeDZNT3lobVBSdFFhVGt6dkhTSEtqZnRo?=
 =?utf-8?B?K040VEFuM0RpcGJpMlk2SisvYXN1SlNKWkJxSTRUOEFENTBMWjFkZGdyTmIy?=
 =?utf-8?B?M1E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: c0e9e3be-8d7e-4396-0643-08dd3bb8dee7
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 14:18:55.7565
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5IptGFrjIRW2j0+yMVjpuYo96mwcBFjgGoHnEs66DXx/OGWUc5GkfkKbw6r49lNhMNsO/u67mc1+1gp2E5fOVMRL6mQrd8ydi3M4FaG6g9c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10183
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 23 Jan 2025 14:19:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6158

Hi Antonin,

On 1/17/25 3:19 PM, Antonin Godard wrote:
> We document how to add ptest support for a recipe by inheriting the
> ptest class. We may as well tell the user to inherit a ptest class for a
> common framework which does most of the job for you.
> 
> Suggested-by: Quentin Schulz <quentin.schulz@cherry.de>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/test-manual/ptest.rst | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/documentation/test-manual/ptest.rst b/documentation/test-manual/ptest.rst
> index dea1bad23bd98817a2020030efdad7ce4e4b36c0..d5a0d007ac118ced77c06b141d4e681f81e60cd2 100644
> --- a/documentation/test-manual/ptest.rst
> +++ b/documentation/test-manual/ptest.rst
> @@ -61,6 +61,19 @@ test. Here is what you have to do for each recipe:
>   
>         inherit ptest
>   
> +   .. note::
> +
> +      Existing class for common frameworks already exist in

s/Existing class/Classes/

> +      :oe_git:`openembedded-core </openembedded-core>`, such as:

A bit of an odd choice to link to the git repo here? Don't we want 
:term:`OpenEmbedded-Core (OE-Core)` instead? or at least point to 
meta/classes-recipe/ directory?

> +
> +      -  :oe_git:`meta/classes-recipe/go-ptest </openembedded-core/tree/meta/classes-recipe/go-ptest.bbclass>`
> +      -  :oe_git:`meta/classes-recipe/ptest-cargo </openembedded-core/tree/meta/classes-recipe/ptest-cargo.bbclass>`
> +      -  :oe_git:`meta/classes-recipe/ptest-perl </openembedded-core/tree/meta/classes-recipe/ptest-perl.bbclass>`
> +      -  :oe_git:`meta/classes-recipe/ptest-python-pytest </openembedded-core/tree/meta/classes-recipe/ptest-python-pytest.bbclass>`
> +

Now to come to think of it... Maybe all of this would be more 
straightforward if we added sections in ref-manual/classes.rst for each 
special ptest class? Then we just have to point at those via the usual 
mechanism of :ref:`ref-classes-<>`? We could also explain a few 
class-specific variables, like PTEST_PYTEST_DIR, GOPTESTBUILDFLAGS, 
GOPTESTFLAGS (though those two are in go.bbclass for some reason), 
RUST_TEST_ARGS, CARGO_TEST_BINARIES_FILES to only name those.
If you prefer to stay with the links for now, I would recommend to only 
keep the name of the class as that's what will matter to the user (to 
pass it to "inherit" directive).

Cheers,
Quentin

