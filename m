Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48704D3F06A
	for <webhook@archiver.kernel.org>; Wed, 28 Jan 2026 14:11:43 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.58])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13764.1769609499630408080
 for <docs@lists.yoctoproject.org>;
 Wed, 28 Jan 2026 06:11:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=OYwvWmom;
 spf=pass (domain: cherry.de, ip: 52.101.84.58, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rkFPV1GB8poIMSQg1DlShVkSHcKEvpJV572gvPxAXwLYuTJuky5a/N4ByNtU1+mcR+GB2pARHKLVa3qzywLcBC8WhDea4mhx4XGJ2MyenQPxqaNNtJh6YMiEVlK5OhYBKn+hqcHvJTQsb7Gg5E7q9jz2l0JBO7CYOahL3CWbWa0J7ZtBmD/Uod8EC1tT56FBoUIy1utFhUuZ79LuzTXcypIF0EvCT8crPZ78K4PssMCKIPbxRzo16phoR8YER3MhrHxA9TCQc+xsLoBK6O36pZOeHSST2Lwil/QEFkkiNunULVq5Oy5hzbyCiq3q/Wx7rP1IZjgY34EgwGAm3/OFgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JVMhd0rSGu33Wj8lZnW4cc+QJbJvei4HkitqIFMIxu4=;
 b=YTAL5lGpz4li3rj12bb+c0sFhVNjzar9vKJKAuZMXmheiqGE9/HDxW35Hy776IoIr/A9LchcAusPNslV254tEqbzrJAU5W8hHYP0IIl7FfbdD1Lqc30C9dhR5H1f9EjpEihMGnJcqEBbIf3rb4AtLulFD/9aoLg7F8VBFgxyA8HRFy5CFJcIN8/E3BP2KZE41d4r20YpeDzr++/sT7u+FgXOo+fY+lAa+EoUb4zy5CWTc75DvLAeGyII1nmsP7D0YS4XtZyetn4P/uQeLgqJymeapbd5Y80dJllhYdVbZNyswAp7aU9nsiPVsrP4o+tzBhhWuLtV1B5VzgrCwxDVvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JVMhd0rSGu33Wj8lZnW4cc+QJbJvei4HkitqIFMIxu4=;
 b=OYwvWmomq0mHM0OW8lqZroQiY+lFBF5bDWOhDllFeRmlwIC2An6TfyCwe000VTqineQXLYZwj2SLVk6DylLoVaNuzx8cFOZBtux4tIfqnr/qBrPuUW/sWjBCjGzQXWRicGHMyY4xY2qqUwMvwTSG+uPoHmn7DQ7tMZHsnFWpcSQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by AM0PR04MB11996.eurprd04.prod.outlook.com (2603:10a6:20b:6fd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 14:11:35 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9564.006; Wed, 28 Jan 2026
 14:11:35 +0000
Message-ID: <6a438fee-e821-491a-a7af-4da5b63b90e7@cherry.de>
Date: Wed, 28 Jan 2026 15:11:22 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 45/56] dev-manual/vulnerabilities.rst: remove
 obsolete poky repo references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
 <20260127-remove-poky-references-v2-45-74bf80cc4e5a@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260127-remove-poky-references-v2-45-74bf80cc4e5a@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0143.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::14) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|AM0PR04MB11996:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b7e754c-1256-4f5a-8e22-08de5e772524
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Z20vWnEwbWU2OUs1TXBzVXNSa0V1WXAwdDhTcTRwUldLUkJaSHRiNkl0bzV5?=
 =?utf-8?B?OVIxM0w2bzlndXNsemJoNkllVEE3eVBHK0FrS2FIWlhGT2FyWXpBSjhxNG9F?=
 =?utf-8?B?ejFFWE1JQzlwb3hXUElYSGlKeHMxTDdRRzNPamdjWkRaZ0JmZ0hyUVRuREV3?=
 =?utf-8?B?WXo2czROcDBrWmJQcWZLYTJJeFVkVG1zb2ZYTmMwVEpoZGpvRFJha25UZXJK?=
 =?utf-8?B?bVhDZGJ3MUZ0OW45elhoRkVIQ2NSNDM3bVczWlpsM0Q5RnZrZE1Ec2VkNGNv?=
 =?utf-8?B?NHV2N0xCSWUyNDRrZDFzWnVsYzZhWTloQitoeXp0aEx5MkFqUW9COXNaaVpp?=
 =?utf-8?B?eEdWV0N3VDJ6UVBYblNEUU1nZFdDbFVxWUJCQUFML2lobll1dnVseTN2UTZ1?=
 =?utf-8?B?c0pnM3BJSzlYM2VYV3dVSnlTaGRvQUFQdEY2ckE3aURZQTZkMTJ5RDQ4MHFa?=
 =?utf-8?B?b1V3LzlkU25ENU5JNnhkWVIvZVIyTC9uUFhpN0FubjZkUWRMSWVQWDFqeC9r?=
 =?utf-8?B?RWNLeFN2aXBKeEVGZ2lMRUdSY01qekdlSzJLUEtZaW9RMVlzeTQwQ0xrS2RF?=
 =?utf-8?B?Rm8yM3gxRHRVcXNGQ3N6QzZVQXRqNlZSOWNkTnNuRVdLREVEdG5OUnlkWHRM?=
 =?utf-8?B?dSs0Y0huVnhpN29aMEZuNnExZG82Y3lralZ5cllHcEJqRHJUR2ZFT1pGR01n?=
 =?utf-8?B?RTZQYXhnMXJYTUhjc01IdEZBamVrWDNPZXJKQmlhK3AzcGEyY0s5TkMzaFBE?=
 =?utf-8?B?TUxPNjFrY3lJbXd6dWRrRzQ5R2NpNnJNTmFMdHQ5eWw0d255OFJ4SXRZcG9n?=
 =?utf-8?B?MlJTM2tDTlJuaHZJVjBDN3ZndUlrcytrSGhIdTVJS0hldlJtbS8rN3NVMkNk?=
 =?utf-8?B?NjAxVWlxRjdNd0RGR0dYb1ZLcVdlTWhicmJCL05ReG9KdURjTDBQWkhrbFc4?=
 =?utf-8?B?dUZjZWxiZkxZSkJiSGw1bndubU94b3YyUlhDQ2ZNd0JQS2lORmhwQ0ZGSkNn?=
 =?utf-8?B?eXZRanp6WkUvaUR6RUpoRDQ1WERuMUlsaUp4MmhxWjRXTldrenpIL3Fwakh4?=
 =?utf-8?B?MnhCaEdMRmNKRXZlTlU1a0hTalpBNkp1TTI5VVVYTHMwRjBIMXJZako1NUR5?=
 =?utf-8?B?a3J5WTJJLzA4TXpZZFFaNVBBdkhxcE5nQVk4cGxrSkZFQ1JTaVNxMWpkTzha?=
 =?utf-8?B?L3g1NzhrTHpieEtONUcxZTZmQ3hQeWljdVlQUmNYb0U2VENoQWZoRGtwYSt3?=
 =?utf-8?B?c05abFJ4TE9IVVl6SGRYZk1aOTYyaVFVUlYrOGlDUnBTalRiU1VzTnVrdjNa?=
 =?utf-8?B?UzBhWFdxU2FJTUZRaGUxc0IrRllQYTU2ZUtzMGtRWldNQU9taHBOU0xpZVA2?=
 =?utf-8?B?dDFvSjRsTzYzZ2NDUzZQMnRtL1hrOFc3dlh5WHlIRnowUUZvc3BNV2NuY2JF?=
 =?utf-8?B?STJBaDFJalpJS3FnQjBBQlpMb2RRNytTOE9LTElGdm90WW44cVd1bXdUSWh4?=
 =?utf-8?B?NW5EWm44aFlONWNwTEZOZldndmRtT09GQ1ZReitRbDJIR2g2R3lGTEVNOTVL?=
 =?utf-8?B?a096S3cwRlNQenVBSi9PTS9HMGQwZ0gydzBnVTlMV3pYb2hwL2Rqb0lRK2R6?=
 =?utf-8?B?Q3ZBT1dUQWI0ek9CSC93UHVscW0vOHZNaWM4OVJnVWQ2SDc4dExsTVVhRWU1?=
 =?utf-8?B?aGl1RUpTMzZ0ZVJuTHhNbVc2dGNnWlNzc0o4QnU1SGNKTnZwTEU1aG9FOXNO?=
 =?utf-8?B?eTVicDRNUkIwWmcyRVU4TXRkbnBqVUZQVDFhMnBKdVR1bGx1NDducXAzM0Nv?=
 =?utf-8?B?Ty82WklYSzJsZ2dVbG1lcitpWjE1RTBpM0VCMVk2YXlCU01XbmFYZjVKUHYx?=
 =?utf-8?B?WnZ1ajhSaEgrY0xMaWd0Qy9RSmNQdUZuWHlsbm54MDFnKzAzZzNtWXRCWmY4?=
 =?utf-8?B?b2RNUmVlQXBnSVE2WEhETDlDYWxFVVYxRFBoeG9FMEZEZTJqbnlDNUhyYnYr?=
 =?utf-8?B?UmIyL0ZyQk5KV1ZDSFk0UWlLMGQ0dkt5TUpMMzlMTytReVNCWVlybXhnZysw?=
 =?utf-8?B?TDU5UjN2QUVrdW5tVHNoaWxsMWw2eE5rVDVGU094Rjc3ZWF5amlpQ1MyM2FU?=
 =?utf-8?Q?WoUg=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SUJkTkNGdE9nMytObTFDZmFBUExVaFVJRklaeVZkM3V5YXdZbm1UQzJ5MWZv?=
 =?utf-8?B?OGJ2a2lOMmo5YWRieW00VDJ1dnJ3ZEJZUS9QSkdSWFovVHZaMStDRlRtNnpy?=
 =?utf-8?B?cUJiR0VqbkRvWHJGN1VkZU5SVGVWUGlpcHdoK285ckNJNzhEWmZubDJBQXp6?=
 =?utf-8?B?M0FhMWpYS0RYeGxWOUdmSkZ3U0U5aDRwdFdvdU1uV0dVc3kwTDlDdzJ3N3JW?=
 =?utf-8?B?ZVkwRmoxb3QybXNHMUJQWk9zd3plSnNOZmlkYm9aWXpESi9qTmY1S3BraFZp?=
 =?utf-8?B?RGg2Nkk0dHRWR0VRRGdRck51RWM2YzkzeFZ0QzZjOGdSSVhVdW9OOXQ5QzE5?=
 =?utf-8?B?MXlzR3FJOGdIb0doQkZabDlWU2o5Z2JUc0lGa1VNRVBOckEva1NYRm9rWE1x?=
 =?utf-8?B?ZnVYRFpyMm0zRDFKSHFkMHBKNVh1VnN6Tm55OW52NXRtY3RvaGFYVjhRSWRw?=
 =?utf-8?B?UWdoVENnTWpHS2dFK1Y5aEdXZytMS3QrSHI0clBNTm1UQ1Q4bGZ0cTJSaUhl?=
 =?utf-8?B?NXU4cVNlbVNtQmhIamxZNmlseVpvNTU2L0VhdzYxRXBsUVQxZTF5dlZQVU5Q?=
 =?utf-8?B?Q0QrcDFqaUxNbFZtb21MQ3gweHVUdTJIT1RkdHFsWTVPTHR5Q05rM05aYXhw?=
 =?utf-8?B?Q09uMnVoVWpzak5PSWlXU2gxUmJFK2ZNZXFVcWZQVWl6ckltWjJNSGVOYmFr?=
 =?utf-8?B?cmtMYkJwcHlYejlrOUYveE1nTmZMOVVBZUQ5VDluNXJ4UDgzZW9ZTTNnSXhJ?=
 =?utf-8?B?eHpGNzJsYWpFamUvSzNyWkZWSFp2YlVreXJJYVVzdWkxZm8vWXdRYy9xcHNr?=
 =?utf-8?B?bzFoc29KTjUvdkVvcnRPVjFnUHhkbkcyZ2hPQWI1OE1xaHJGYVd1cUdyWHhI?=
 =?utf-8?B?d1RsaXZPb2lOSFNEMHYxQXZ0L0pKRmVCZ0dTaGRndXBJcXVTTHk3TjIwNDd1?=
 =?utf-8?B?aktpQlF1NUJINldieUJlZGxpSmF2YmhjTnd3bFgrYzJVUEVZNXBTSG8rNVk0?=
 =?utf-8?B?Kyt3VzVHMWwzWGhxUjhvRjBrbGhIamxQa2FOTVBsdEJ6YldhV1VRMmZRSXpZ?=
 =?utf-8?B?ZHBsS1R4RDFoblNxOGNQem5LTElDbDFDUHJHRW01emVRWkRNczRJVGx2a3Na?=
 =?utf-8?B?YkxYWFNhUXF4Vmd6SWZDU1QySjNJV1F1N3NwY1duNXloaHNPK3NkZmNjKzQ2?=
 =?utf-8?B?ZkFrMzB3eUZmSE1rM0RrMEpqL0lFcERqaXBXV05RNkRsdDArSnc2eUdPMWl1?=
 =?utf-8?B?V2xhUmtaSytSaEgvNzY3R1ZDZ0ZUQjVEUUxNT2tMa1lwaTAzazFaYmxlemRx?=
 =?utf-8?B?aklkWU9TQWFud0x3bVpRUGhZWkZJbWlWYTlkaXg5UXNxSlJoeW1KR3A1VzJX?=
 =?utf-8?B?bW9LOXduYzNXQzhMbG1jOXlvbkNGWG5Za1M4R0drRk5GRGFNOWdzU0l5WGtv?=
 =?utf-8?B?RHFlVzdIaFN2NnhHL3kyQ0dkRVEwNzVJSzdjQTBTV1g3MFNTRjduRERHNWJl?=
 =?utf-8?B?TmtrNGlXMnRMd3dBMHkzNWNjSjhPZ29GQmYrRkxva2h2WkVTWnF6NGt2SWk0?=
 =?utf-8?B?cVVQWkpnaEIxcVB5aHNmelAvaU9yRWc4UDJDNUpQZ0h3WDNvQzRQdDZ4QVVv?=
 =?utf-8?B?ZzR1bC9UM0xMUDMwUHFYOXExN2VoZDh6RjBYeGdUU0RCc3Y4NENMcjVxSFhH?=
 =?utf-8?B?QUxCRWpjaEVXb0ZWb2hlTSt5cEdMKzBJbHFmREU2Y2U5VlRxdHJZY0Q1NldJ?=
 =?utf-8?B?Q2lCQXZOanFISlI3cVVrRlN5R0VqSzkyRXBFblVpT2l1cGxMYS91V3pNaXpL?=
 =?utf-8?B?U0xTcjVyVEo2TnZHajB0dUQxUitkYzNFd2NxaHFCbGVRdXoyQTF0UlBHRTlp?=
 =?utf-8?B?UzQ5Y3ErdlBPUWVIRXhQSnhLMjJtbHBOam11VEJGNFhWVzFuS0UxSzQrMXpv?=
 =?utf-8?B?d2pyREwwR1JoV0JKSlhqQU1hMVJ4OFNrTjhESnBmb0lRc2Y2ZkJvK3dITXNQ?=
 =?utf-8?B?TEx0VzVaVjN1clRMNFY0T0lpbnpHUGwxK0MxblJLQW56bEp6SUh2bFpIMnYx?=
 =?utf-8?B?OFdQN2JhWjBJOEdhNk1qR3JidFZEYzB4K2tTMHFwN2VVbjRONU05Zlg1bXF2?=
 =?utf-8?B?R2JFZnhCSjRPZEJIVTZ3TGpFZ2xPYjROUmpIenhPa2IrUHRmem9ESnB2LzRL?=
 =?utf-8?B?TWlZZVNoRDNIQkVyQnltaFpuNkhIczQ3R05pSzMxOHF3TjBPM3c0VWlMdGs5?=
 =?utf-8?B?MnN3T2tBVXZnVWc4aGpyeERTMm9pUFdoUVd4RkU3cGtDRFFBSU1UN2E0SFow?=
 =?utf-8?B?NlMwekFJYnhQQkJuNmdOMzVjemlDZ2VZTGFoN3Y3Q25sN2RJdmY2U3A1am54?=
 =?utf-8?Q?3tIOnApfEaz26lJE8HrIgybRantHV1F6qBMsb?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b7e754c-1256-4f5a-8e22-08de5e772524
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 14:11:35.2019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DNzlBawRIxjQa3L2o41dJXJVSVzJOftTdQc926s8pICOGkMAot/Gq+UclFnw7POcFao0pEd65Nv2LQSlQQdQCGgf12xOP2dS9S/xGtBKTIA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB11996
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 28 Jan 2026 14:11:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8770

Hi Antonin,

On 1/27/26 9:19 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Refresh the document now that the Poky repository is obsolete. Mention
> that only vulnerabilities in OpenEmbedded-Core are tracked as that's
> where the packages are.
> 

As far as I could tell, no changes since v1 and there I had

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

