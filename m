Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AAD2E7716A
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 10:05:47 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.75])
 by mx.groups.io with SMTP id smtpd.web10.78275.1734429937744094891
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Dec 2024 02:05:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=J/KnBv97;
 spf=pass (domain: cherry.de, ip: 40.107.104.75, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ALfGCnXiMaqPTRxaAbwEBW7Xy1NHcfw0xlRUwhBz9iZ2sTTBeB6whXzQLCnHoW0taHf3raqNh0I/2uFK7vx9mUMHPUe5BBwdcmwtjB+9wsle8Peog66xz1rk1NSa6hAp0loptEYJMIyX/xuqJFaTJBvSAh6U05ozJ/qillZzTUNB7aNMTJ/n8zzKQX1R7oQp2IVOYgFaNisSH0vMx91g25dEQSQINYHZfJ0KYWkuh4qAP6zKondcaUdPsThHWLe4WtB3QMn8U2wqoh1jcs5MIAweEWLGxAJR98vn+6pHeD6jVGZrDxOBGRaIEi/jpC8RY4TOGcwjyGx10JD05HFYRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rXAJp9HoVRMX/4FTzcDHvwFXEIM0d8Q46eA8kOj2I70=;
 b=EXw2smOIzFkjtnDRwc23RWYbYav0UD6BC5rNs8TWwOy6pDG8+xQgbMR6oqOAiixLMYWMXI7Wfnn/sPJQY/PAp3Ce2LOcMIQlgFcP3nfmjVF8nX9k+UNGyb/P96cbfNljsmDJqqqzkiX7oHaqcz9vNlyMclaldciFW6da+iubIyue03wBlyp7DvnTsueqvWFF4Ts23kaLUVL9+2++XL7enIFggzwaYUcq6fWuvqA+DwoJf+d2Yqad+myS5q027I9ELYzGXTojy8FHd2gU/kwj9AUmi6vybjeF0VKWOJL+tTZI2hLVFDvq6KWBrw1WV/MOYBh63UsXGE5o91vfBk0d3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rXAJp9HoVRMX/4FTzcDHvwFXEIM0d8Q46eA8kOj2I70=;
 b=J/KnBv97OyQMwoBoPw00d+X49dOK0R5pv1HqcM/N60qs0UPIINjscULqCrG/spT/QrFm9Wzm0etkomu+ADVQzvePnzXhNyLF8KgOkHlVBwY7OtwPfiARRzzzy0y6QwtqSXvCdxd1FXmSp/zVgH6D2br70kQj3JLVvydkB/fQ/Qg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DB9PR04MB9308.eurprd04.prod.outlook.com (2603:10a6:10:36c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.20; Tue, 17 Dec
 2024 10:05:33 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8272.005; Tue, 17 Dec 2024
 10:05:33 +0000
Message-ID: <4912e1e0-8a07-47b4-b10e-52308451946c@cherry.de>
Date: Tue, 17 Dec 2024 11:05:32 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [yocto-docs PATCH 01/14] ref-manual/variables: document
 the KERNEL_CONSOLE variable
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241217-release-note-5-2-updates-v1-0-b189493b1b09@bootlin.com>
 <20241217-release-note-5-2-updates-v1-1-b189493b1b09@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241217-release-note-5-2-updates-v1-1-b189493b1b09@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0302.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f6::8) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DB9PR04MB9308:EE_
X-MS-Office365-Filtering-Correlation-Id: f620081f-fecc-457d-2e70-08dd1e825864
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?N24zM3FFeEwrdDdSL2dzK2loM05JdGQwb2kzV05UKzh0cUVyeU1MdFJqTTRF?=
 =?utf-8?B?ZXhqbDRjSVRob3g3ekJuYXhoZ3J4V1plVDM1MjNSOFN6K0xhZkl2bHgwV2hE?=
 =?utf-8?B?OVU1cjlab0FpV0Rka2hERW90OFpMR3ppRE1LdWJwSzJKcDVlV1BINTJUdlB0?=
 =?utf-8?B?dmRNbzZPMHpidExYZG9JcGM0aVJmQis0MVNHajhzNDFiK1F3SEpyUWRseVc3?=
 =?utf-8?B?OGtjaUp1d01YZk4zTlpOM3Jtamx3OTZ1WTNLalJob0hLelBuOFVqNTFycEhp?=
 =?utf-8?B?VVlJaGgzRkFza2NHVTNKS1l2NlBwdUx1MjNLbFU4dFNvbUxTNVhvSmJzWGli?=
 =?utf-8?B?Nks1YVlaNS9Oa2FhZDQ0WEFhSVRMUVFFS0JObkpSdG9WclByTEZ2bS9lQXdx?=
 =?utf-8?B?Q0RLeHU4aVVTaWk1Uy9uUUx0bmc4NitSdE1scFNrOGRtM1M4ay90Z2RmL3Vj?=
 =?utf-8?B?d0tSOEpEUTQ4elMxTU9IUk1DT21lU21QRzdlcGFTZXVHSkxJeGtTL2tDUGY5?=
 =?utf-8?B?SDM2U1FETGRzZVhFaEFtbkl0VjhqdXo2Mjk0Ti82a0F4d2VVVi9LQmVZcWI1?=
 =?utf-8?B?Y3JOQktOOWtUT1RveWFucHI3aHRYa1UxaUxpK2tvYkpmaFM3cDg2R29kcEZ5?=
 =?utf-8?B?aktEMWtZWWZsNkVzSTcrdXYvOCs4OTNqTjd2bGZzNUNaVU1oUVErdGxqY3dj?=
 =?utf-8?B?VnRPcHBkZklSVk5paU9EVXlNN2JPOGh3ZVVYeURqeDZpQlJsN2RHN3kva1ZN?=
 =?utf-8?B?ZXZINDZhV0lyYklpTjIra3hBRmR0ak1tU3Nvdm5TV0hQL2NEYm9EUm9pMHNX?=
 =?utf-8?B?cG5RQUJaeVNveklmU29Vc280VktmNlFkYlA3dFo0SnlNSFM1MlFPaWg5Sndv?=
 =?utf-8?B?NVRiSnFOWnBzMm9VaERnbVQxdEVpMDlxUDdJSnZPS3M3QWJtcjlLcFhTdVNk?=
 =?utf-8?B?bnhONVowQjZMd1JPT0NrN0hGck0ySzgxWTVmRFlKQU95OUliZGVvejNRQ2pV?=
 =?utf-8?B?SUF2WDhETlBRS1c3dTRFemJ4OUliMEpDZTJURGRVMFRzSGZkbDA3V2R6TUJE?=
 =?utf-8?B?NmZHRlJvN2RQUnlJV3ZrbkFsT1lzanp3UmNqNllvNG94QnRlc3BUcW0wOW5G?=
 =?utf-8?B?NzdERXNYYVpJY3RjY3gybmhDM2c1VE40UDJBYW0xRlhqUlNQYlJIaGI2Wkgw?=
 =?utf-8?B?eW9Gd0tReVJGUHkydjFsaVMvTGNjVXd1SFZ3YXlWVkNRcHkwL1pqS3JDWUxR?=
 =?utf-8?B?WEhUdTdYU3FFQnFHbXVEaEd4RmJORXRRRG1TdHc4dktoY3hCQkVqT1VsVGZz?=
 =?utf-8?B?TlZKUmVwNW5IMUNvNThSTCthMnl0MzV4bE44T2pRazJkb25jbWZ5eGdmSG5U?=
 =?utf-8?B?MnlrYTAza0IzaU5LU2d3UWY2Q1E1RkpGSHFaVFN0RFNBRTRPemNGaDVyT0FO?=
 =?utf-8?B?S3lTSzAzMkxhYnA0L2RZUUZuTlFYRWhjREJKUkNPakNTV1pKU0NMVFhOcWZu?=
 =?utf-8?B?cVprSnZpWk5RSVg4b0xGQ1llSG55VGdLbmpoRC9QTFNLNTh3YUlkUnV0QVJ0?=
 =?utf-8?B?R1BFRC9sUURiaTdBNDNZUTlzQnlGY3hCSElkWnRaeHNLbzlmOFB5Y3Z3MDRi?=
 =?utf-8?B?Sy96b0s0VFZKNlpRMU1TcDRkdWhIZ0E2YUN6d0tVNVJWQ25POTFvTm50MW54?=
 =?utf-8?B?bmlVYVMzV0U0UnQ4N3lvaHVScEhYK3lDQXZydzIxd1R5U0NkZElLL1o4eFZv?=
 =?utf-8?B?YjNnN1ZXNWE0d3B1RmVZbWs0SWpFYzZHQXZjZzU3YWdGN3poT21XRW5BazdQ?=
 =?utf-8?B?TnJYMUhVNmhWZ2dLNTIrV2dRUEJzRXBkNDdZSDZhWG5MZ2ZwUHJGRzJhNEU1?=
 =?utf-8?Q?U1G/mOYaUFuOl?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UUVCbmNOSjdCRGR4MkNXVXJEQU5jS04zdkJzOXg4QVZaRzZ0SGhaTlJvMklW?=
 =?utf-8?B?UFF0N2kyZm91S0RkQ3YybUo5K2lPMGh4Yi9oWHVZbWlmVGl2VVFvT05KVDcx?=
 =?utf-8?B?b2toUlpFbDFZRjllZmxZR2VNVm9FMzFkMVVHR3ZURHdDN1BQR0dQNCt1V3Fu?=
 =?utf-8?B?MS9xZ1djV3NKelUyc3lYZjVLeGpGUXk5NWhPeVJZV3g1T09odmdpNzFBY2RP?=
 =?utf-8?B?RlFlcXNoM0szcXJZV3hKVnMrUERQSTdxSDk3WGZtT0JHTEZiOStMcG1saUp0?=
 =?utf-8?B?WDNTWFBOQU4zbS9lVFFMVGpDbTJUNVBRN3Q5cXQ3L3J6K1RudGJ5SG9qZzRH?=
 =?utf-8?B?MzZpSVRmZk5GVDY1Q2c2ZHFlbE9PTlJPMnZaMDE4WGxTdU9GOHUzSi9lUGpi?=
 =?utf-8?B?Rm84MGlzTVNiQTh4KzBqZ0JmZlhid1dpRDMwb3VwVTFrbk1PU3BPUGpLRXJx?=
 =?utf-8?B?YlBOdFVFeWlPVHNRT2dqRDRkMG1PWXhGZ3lPSlBYUjh5NzhWcm5Md0NRVDBv?=
 =?utf-8?B?dHp2cC9SenBaK0lIUmNhK3pJMWEvRXQyT1E4ZmRvdi8ya2FlTmhzV1ZsK1k3?=
 =?utf-8?B?RUVWRTN0VDh0eGdUaXhENng1VzgvS1AydDRWS1I0eUk5MFFPeXFhdHdBMklu?=
 =?utf-8?B?V1hacWd6eGRrRnFnek5ybXNZcmJWOCtNLzNidnN3S3UyenlzUm4valR3NS94?=
 =?utf-8?B?UW8yQTJlVWdOR1FHZWNHbitwSXQyM3VMQjYvbTZDeTdxa0xKOFdRa1g5dnlL?=
 =?utf-8?B?WHhqaFlkZldzaW51bkg4UlpaZXVtaDBDb2VBZlFxQ1FFekhna3E0TXE1SUZ4?=
 =?utf-8?B?NDNEVTB4NFJIaFBXL1RtYWZxbWc5TmdYYTBaR1RNVTN6RnB5YTFGbVhNVUpB?=
 =?utf-8?B?Z2NCa2xqWC9kWlY4WUJ4RzZhWFg4V1kxeTcxUytheCtYQW9jRldVR1BnMmh0?=
 =?utf-8?B?Z250SElBQldCTGVSUlZ3NjZjUG4xd0FzaG9kSEIzS2NOanFTdG9KeW9yVXFx?=
 =?utf-8?B?S1RVc21wcDdoQnFJc1prOEo2c0xlQjF2Ty9TY05FSE0wQ3EwejlwbHk3NVpt?=
 =?utf-8?B?QXVHeEk1SzJVcG9KMERWMklHQkhxRW91aTlxc05JNktXcFpnQ2trUkhpdnhl?=
 =?utf-8?B?b1FpdW5kdENyT1NWUEE1L0JaMkg0c0RIYzQ5WHhNY05TejFaWTVXV3hDL3VK?=
 =?utf-8?B?NGR1MFBnOXhqeEhuWnA3SnQ0UytaU3FuVlhyN2JRM3IvbDlCd3hvZVdmUU5q?=
 =?utf-8?B?M2NjV3V4S1JTU0ZDcnkwcXF0VlM1MGUzalZXUFBZMitEaUZPUHJEdDZvMTJM?=
 =?utf-8?B?MlZoYzVSdXBITXZybUxSZWdRUk5CY044eUVIMVEzYStodmRzdWlCN1Y3YU43?=
 =?utf-8?B?czVmWHhlZ3kwR2swQ2plOW5qbVA5T2RsU21ERmRQZ3BXOFVTdlNuQXVEbVJC?=
 =?utf-8?B?OExQWVJJemE3cUZvZWFCNndOSVdySzYvdG9GeUdwMGthbVpESHFLbjFDK1VT?=
 =?utf-8?B?ZlJQZHp2RWFOdFVlSjAxYVVCZDJrbHlXdkFCMGpteFNGMzlxVjBPalJOVEx0?=
 =?utf-8?B?NmUrOWtoR3NKaFEyY0JMME9iUXdwa0VhdEd0d09ERmkyV05reTJEUjNxeXFG?=
 =?utf-8?B?SlM3eTVjaXo2RkljTUNIR3I3a2VUS0pYM2k0UXNSRlJmK1k4dVpIYTI1ZmJ6?=
 =?utf-8?B?LzYxa2tkUWxsL1lmZnNQNk5vMk5raEdhNWJTcGpSZGpWbDZOQ0FFN1lzdlIy?=
 =?utf-8?B?ZExsYTBSaUx2K2dkWjYvNERqZ1FFcWtLRHlROUcySnB6UW9LRDRNOHdwa3lR?=
 =?utf-8?B?aVl4Z3dsUHhXUzlIbWF0RnNOQWVZeUpQTXErdVI1Q05YZCtseTgyeTlILzJX?=
 =?utf-8?B?R1paZWNMZjFkZk5JUzZwaWFjUmFyL2lnSDQ2UDRxN3czdmpTYVRBalhJY0xj?=
 =?utf-8?B?UlJyaStCbkNYQnlaOXlLSkVtRWt1RUxPT1JEaVFwYms4ZSs4SmFMUzlzczJn?=
 =?utf-8?B?cFQwckxJWGRuNE9NQzZFK0prbDErNkJtcEpuYWNTQWd6QkkvRnhpK0NRNXFD?=
 =?utf-8?B?cjB4dzlmTC94T0hwSEJTdFpiVXRndWtxVWxXUU9jTUF6OWpPK1hJenRQZXZN?=
 =?utf-8?B?TnhGaGpNWFYvK01PdXdsZzREdHByZEtlY1ZEeFl2cHJVbGJqWG1IR0hCTEpr?=
 =?utf-8?B?dVE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: f620081f-fecc-457d-2e70-08dd1e825864
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 10:05:33.5393
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aT8rm1jEhVVywuQulwDDuU/UsvL4S3NaFmRFyDOPg++JQPZyp4ayVK1H7eX9XZNqQhgsvEKz8O8b1PXn2zQwMxFlJBELYIi6I4utJAOIq4Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9308
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 17 Dec 2024 10:05:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5950

Hi Antonin,

On 12/17/24 10:27 AM, Antonin Godard via lists.yoctoproject.org wrote:
> This variables holds the value of the `console` kernel command line
> parameter.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/ref-manual/variables.rst | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 1eee617d59ccddc9af0ffb95ea3635a707718152..c6d3d1bba9961704fca25921b346d5282e118db4 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -4579,6 +4579,12 @@ system and gives an overview of their function and contents.
>         You can register custom kernel image types with the
>         :ref:`ref-classes-kernel` class using this variable.
>   
> +   :term:`KERNEL_CONSOLE`
> +     The :term:`KERNEL_CONSOLE` variable holds the value of the ``console``
> +     parameter of the kernel command line and can be used in places such as a
> +     ``wks`` description file for :ref:`Wic images <dev-manual/wic:creating
> +     partitioned images using wic>`.
> +

We could provide a link to the kernel command line documentation 
(https://www.kernel.org/doc/html/v6.12/admin-guide/kernel-parameters.html) 
and possibly specify the default value (it's in 
meta/conf/distro/include/default-distrovars.inc; essentially the first 
console device and its setting from SERIAL_CONSOLES if any set, 
otherwise ttyS0,115200).

In any case,

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

