Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EF50C04A68
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 07:54:29 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.83])
 by mx.groups.io with SMTP id smtpd.web12.17137.1658908467379412570
 for <docs@lists.yoctoproject.org>;
 Wed, 27 Jul 2022 00:54:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=RHHs2VJj;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.6.83,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Upr4bM4h8r9KXe28NLq61722M9eSJ6ar+0jeXJk93w5dv46gMhk3/IsbUsYhLVDEEsPelX1M7nASy6xq//siyaNoHy9vuZg9jrYWl5tg7xjlQECHF4Mm3IT15gIdyvv+Mr6R0Kitu+wiqzSjZ9Pv4E+d8szOg1ox0c4+LdgclvkFQDtXwfL4ZnJIdU24crfNfXGImijfESzPr/rwZdyUjMB+oxlB1ybtnCDHkI2bq1oHH7VYEdJdUuoyfNIOKNrpdPNeCVfC9Uf+AWFHu4gD1uNbvJIDP8q/UqKHj5qgsrkN6K7f+/TIraBfaUZmkKErzyTVwa1W2gyTtt7glGpzBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LhOVNNPE2lsbT7OVdGMVGquqHXfikKGz4gmeDMiqgyE=;
 b=j7ZlUzAHK+TATwJSvZY+hqJ4CKZwgnmuAvyMC/Ob4W8ejE04QBoKvARGLP091w/vL4mIiowG//WA7TuXgZHVD1/kfXaqA/BOOvHLfsOvoEUbsCE15SkGiYV2rzZfj8xmsbrmV0pKHaty3V7KBrII8SlWCAVEO/7B9oDRRZE+RbyNga7lUeDPxoCkMcBc8QtQHWx3674W1JL+JG8Tt4AcGIV/1Ij8ukEW1lg6Tee42clZ+F9RXIfUXEOYNlwLHf9c1zLU+FWBHxi9jgzT8/ZCvPeQKroGm4HmwpV2dl4ojaKkMMlxA4eqI9k3/1r4QE/0BcVVsyaUNe/45AQbVCr7Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LhOVNNPE2lsbT7OVdGMVGquqHXfikKGz4gmeDMiqgyE=;
 b=RHHs2VJjaB4wDeDOj4NOt9G2d2r9xDnk0Uf8pdmF2XpzgbjuUJ+Eug5Q7EYqey53g5fP8/msHXIMJGcH9i6FY+iwdhfp+ruHLLg1cTfPUWWqN71xnG+JsdHcpT3Qzb4ig76zOlgH2W/bulA74X7xRJmPCLOqmAKDycK0WJu2CjE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by AM0PR04MB6817.eurprd04.prod.outlook.com (2603:10a6:208:17e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.24; Wed, 27 Jul
 2022 07:54:24 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::5c3:766e:66e9:8c4]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::5c3:766e:66e9:8c4%9]) with mapi id 15.20.5458.025; Wed, 27 Jul 2022
 07:54:24 +0000
Message-ID: <cb86d911-5b90-ff46-28fe-d06b8d762d35@theobroma-systems.com>
Date: Wed, 27 Jul 2022 09:54:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [docs] [PATCH] dev-manual: use proper note directive
Content-Language: en-US
To: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
References: <20220726172633.1732800-1-michael.opdenacker@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220726172633.1732800-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0130.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::17) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd3ee0d5-ee8b-4b18-9930-08da6fa538fb
X-MS-TrafficTypeDiagnostic: AM0PR04MB6817:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	H10JNBYp2cAOydA4t8SLokDv7ssyAFV2+R1s715mqR7Q5GEcEBNWa/Gse3i3TtwZOwvtQWdxZqcPLj/QvS/7ZMeCXX+rylrCgtW0tjrVS/QUlevwCnSXZQYfPc+sRwQiU2f+W5fzvgHG/JcrIq8VDZytUEtFWH7Qgrz2hP37TEH4X7xNq6uL6DYgh+53n7Qs0Ww2RTdGL+qfCFBctYlZpDgruhDx/yn97ZyX7xPvKkkr0ZPq+Kwe3v+w6YyZhnc5Ay/rN7aQY3sfBh4LUdneJ4CMA1v+pBS5JYfVOI1Biw9A/HTI0sR3lLVp5TljbnV/tzGXCl49DFFnQrGTNWa+qrPMDptcSaVBbcBejXCG06U1b/Ew/CHnRaJeCKPrrcWQjiEIFUdTbnFC9GOBhd2xKzLKQ7sm1ncUGoKZEXgGCD2pufZbqHQCEYzPqcp/qqGQ29VnS6CGzVmMA2gvf7q4ot1P0KsUsE4Yh3LNxwm7mbnpUPaOBWGfQ2dUyIvKxaHn0vuo2dCMWDppyFm17k5uOhdde4YvB4ERdnqx09j0SCbRl9LjohlTV4icyOscppSgVulvXQ1VWhOxamDCAwDlQ9r/1ksgL8I+vixqN35u+JjhBUze/o6UX7fXOnHKIQYhxexmEcOTe1X7tm2AkWSndPeQUHJmPNIEuWyp5sGNwgl9Rys964AiiPoEYUrIoUDjBx6W6VQUpDHg/bgGXd9JYV5QlOcjxQ7tasRe8HsIXG0L1eUXDvqfoZJmLmi4hrCA3jrSttFHC0/MLwsFyRnIIdxa2rIiOfZPtVP3CDQsEjRvnS3h7qkFRqX0l1attq1j
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(346002)(39850400004)(396003)(376002)(136003)(186003)(41300700001)(66476007)(2616005)(36756003)(8676002)(316002)(66946007)(26005)(66556008)(6506007)(31686004)(53546011)(6512007)(31696002)(8936002)(44832011)(86362001)(478600001)(38100700002)(2906002)(5660300002)(6486002)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Tk9FcUx4SDVHMGY0TEdESlhjSE5obmxNakRYdTBZZVhEU0d4SWFDUHNjR0dF?=
 =?utf-8?B?cmpXUytWNDdtN2dZb2NXQzg1YThJdXBBVTZ4NTBUd3dscnFYeEkzVStRVFlr?=
 =?utf-8?B?ayswZ1BxbHZRODV6Ym1DOWZKY1FMOElTVlZMdFUvaDRXVVNZZmwzMmhoZ2tC?=
 =?utf-8?B?Tk43S3ZBWkdMN0o1MjVob3lENkFGWEtwQlBmbEFodVJSNFJRWHFsS2V1SXFQ?=
 =?utf-8?B?UlVTUHgwWjJvUHdJL3NzUW5veXJaQyt5L3ZtbVlvWkpqb2ZUTVptWnQ5R21w?=
 =?utf-8?B?a1FqNU9kYzJVY0RldGFxM1l1KzJPWEVZd3dLMkdTc2hFckZNK1d1TXlvci9T?=
 =?utf-8?B?UDl6RmIwNE9tZTJtcXRiT1Z1TkM5M1RPTytUWHlweEFKVEE0Y1VHc003dDBD?=
 =?utf-8?B?QnA1M3dKMkZnNnZ2K0pxclp1b1p4ME1nUzhvRDZBRDhwM0huT0puRG5NbXJ1?=
 =?utf-8?B?UXlxaW9iSHZVR09rZEwzcmlPZWdwRTdVZkNlWklRdlR1TEgza0hNaTh5bjIy?=
 =?utf-8?B?T3NNaDE1MXZTVmtPM0Fub1lTZnFGWnZNZGZmbVVZcmtTOVdJc2haMnJRaThL?=
 =?utf-8?B?RnVNMERaMEhoVG03YUtwRlNid2RZcXNiM1VEMU1MRzVkdEswRHo3ZlFxck1v?=
 =?utf-8?B?V21RSVFHMHdkNUZGZFZxYjVkLzdmMkg4QlZmUHB6SHdKK2Q2R1JaUUppSVdw?=
 =?utf-8?B?ay9pbUZua3F2WDdwckRJc3dheEUzelZRMktnU25kSXNjZDhYeGc5MjFMSnhM?=
 =?utf-8?B?NWZMNzg3NnRMeFF4N1VVM0hndTBiSWZTWEhvcCtvTHRYVzVYT3BFSDZkVTQv?=
 =?utf-8?B?VFIvSlN5ejJUVlRlOXhFOWFIdTdHQ2ZGN3Y4MjV6WkNoejJzNHBjTHJ0cDBE?=
 =?utf-8?B?ZVUxNENyUWVlNmNaaDdSdXFzOXFtS2NkMnlGM1J1L2hFWDB3ZEFJamtXelFs?=
 =?utf-8?B?NGJjN1VmS00yQWpRRjN0aXc4UU5KK2NXZ1cydlBTVjdjSjduL1dzcEtJeWFZ?=
 =?utf-8?B?aTZVZXpldExHUm9XM3h0K0RoTFZNYXJnQ0l5YXh6NHlOMDZmNHR1QS9rY0lD?=
 =?utf-8?B?NDdwczBoY1B6cWdFRDJEVUVlL1BsQVNuVGxtTUkwUUZvaWpwcVJOcERvMnpM?=
 =?utf-8?B?MFJKZVFVZnE3Y2ZrOUhIbkhLN2tKTk9MMFN6S1RabUxRbDFkUHBHUmJsc0xv?=
 =?utf-8?B?VWUwanlkdVVZMjQvNWFVeUVSMmVPRDlnWlZpbVpNTHdPcEw2RDlOQ1c0ZktZ?=
 =?utf-8?B?OHBzdWIyVFhSaVJHYzlMMytPanUrRHBLZ3VMUUsybzJEMGh0N0krdHBmRTM0?=
 =?utf-8?B?eklxZ05UUU1ISWhlSmgyRGYyOXducUY5YmRWcVkvZUd1VHVOam9pcWJpZzFG?=
 =?utf-8?B?NkN0SjhuWWVpSjk1YXNIMlR6VlR5VGNzcDRJOHBwSE92dlJTK0xJSWpXN2Vr?=
 =?utf-8?B?UGVjMjhKZmZ0aDRjaEp0QkJLQ2svTHk1c1crcGsyNE9GVSsvMGVYbnZONFRL?=
 =?utf-8?B?Z0s2RnVvbDBjTS9YZk5HTXVBSkdGVG5kRnBBbHcvdXVEMnQxb1FId2RnUk9K?=
 =?utf-8?B?ZUxMalJ1bGNiUUpPSnlMUTNIMVl0RE5RNTdSWktKMmtPdE5abHNSa0JFUVdJ?=
 =?utf-8?B?WGJodDI4RmxNRFBJMjl5eTcxdkIvSktRTUp0QVptR2RKdHZHTHozY05QMk5F?=
 =?utf-8?B?ZjU1NS9TenJpc2FlZm9URlJZaUZiN2pqNkM1NGdRbU05UnRDT3VhU2dYZTJ0?=
 =?utf-8?B?Snk1N2c5Zi9waFpnY0d1ZUVUYXJEdlpsVHJ3VFRYeStQTVg4UEJBMjdhNEF5?=
 =?utf-8?B?ZW41ZjRid0V4L2pCZ3EzU2x3NDVwSys2Zmh1Vm01cFlxVzl0RjU1ZG81elo0?=
 =?utf-8?B?bitEV2hRT1VIeVNqQkxScHBta3pKZ2lUUDNkaTlNcEZFbXRsbFNJbCtxbnUy?=
 =?utf-8?B?MlZ1V1BhaU1iSWgwU3pXd3JCYTdrZVdsaWhscll5dVhhay9ldGQydFU3UDhI?=
 =?utf-8?B?TU5kV2Y5NXhsTTFCUCs3cTc5anE0T3p1WVNvdVFXSU1ybmh4aTJ2dzRhOEps?=
 =?utf-8?B?WXgyYjFJa2hyaVBNc20rcGM2RHpDZVFWczZNeVY3MkgzdkdHazNYYUhvUm8y?=
 =?utf-8?B?MkVjMWFjR1loUGd5KzRESTdON1FWRVFmMVQ5akxKcUJaOXcvRnNYalljZ0Jl?=
 =?utf-8?Q?UAxiPN8pIImN98+iV1zuSaA=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 bd3ee0d5-ee8b-4b18-9930-08da6fa538fb
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2022 07:54:24.4208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 /U5NaFQai09uGwCAWd18dADB+PSIMx8KHzlBy+FXgEBw5Ke6HldNL4E90ZKZKafND17wWr7akmxor7Y4cgtkZQlrDIWvHCw/Q8UA4hQQtuUqF9TWn0HEToL/ViGP1/Xu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6817
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 27 Jul 2022 07:54:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3090

Hi Michael,

On 7/26/22 19:26, Michael Opdenacker via lists.yoctoproject.org wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> 
> For correct rendering of the note
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

Reviewed-by: Quentin Schulz <foss+yocto@0leil.net>

Thanks,
Quentin

