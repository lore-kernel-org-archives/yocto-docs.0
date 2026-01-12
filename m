Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D1EEC9EC90
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 13:26:03 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32557.1768224362558921683
 for <docs@lists.yoctoproject.org>;
 Mon, 12 Jan 2026 05:26:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=AMSw1smw;
 spf=pass (domain: cherry.de, ip: 52.101.84.45, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nEep3L5sAHA/UOxUTTqT0CwFK662Mr9TJA9NEj3b062FZeaSXAaUbk7J/rRwPWVpluUBC7CCtk8nTdelBbQ0XGfrpFNPSILjyohgjKfehOSH+aAx9Dt324J8c/cGZYuDC3InQJq/FVN6mf4VxODF1sczCb+hD0hUtFUvyFU4arYMZXDZvgov1xWgz/Kjlk0XafmG+W6Qnl4g5o3Ss1w0+Ag2QRixv9fJc0zj3Ii/MHWTzwpkvETB8TclLPWAaX3UM0mqwbipaFehDZ13Kz/WmvKila9osfVAhxLEu/ZlBgWUN57vhRQR7HJ0AYsbx+bjX/2SmzC4Gg+WY+As3804hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tGkYVziIUyI22EKLmkqkrV9tHTrhRrdryfnGNP9deE4=;
 b=KXsmJSMW7a4qjTnEv+X+ecj94gYkhddMax58/Y1KvKWYrviiVy3zASzPsApWXjnbAP3VCURb99TURUe8/cQVMl8fb0snFeh7AyRxP+YbiytPWjK0ndCdeDPeLQahJrwC0hO5gbexZrrOubvUhVWvVRKZtegjRVDoiwdNh5ADzKjMnLvgmqX9JVaNUoap7cxINx/xH7LEjLZdUklMHzgwQ9LeG8mKIEY5nZ9txfcFBdIN33ELWHr7R1h6IfQlkWCuApx1s3o+m57ZFfwz8cTLGNT6WQwcyaSbz9wknPqMl8pmRNE70eyix/XJPqyI7cZupeLgGral+xRH9zih2s9PAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tGkYVziIUyI22EKLmkqkrV9tHTrhRrdryfnGNP9deE4=;
 b=AMSw1smwN2ZvifPkw3RvtZfb4hyDo/k5oVXwtjinJar26DJCFFw0lhpmp/wQjvtPqEcMd0TDW2S3H/jrqr6h5chDY+ThNmR9u5odOFaUOl8XKKKMmuzdGyIWA8YvpGu1jqIZC65YuzjjGVzL4M0Ka2QSJVpwaZ0kSmU4fXps9EM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by GVXPR04MB9733.eurprd04.prod.outlook.com (2603:10a6:150:119::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 13:25:56 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 13:25:56 +0000
Message-ID: <73390005-90e0-4918-a73a-da9830c32d8f@cherry.de>
Date: Mon, 12 Jan 2026 14:25:52 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] tools/build-docs-container: make it possible to print
 the distro list
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251222-concurrent-safety-v1-0-e3d86e44cd38@bootlin.com>
 <20251222-concurrent-safety-v1-8-e3d86e44cd38@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251222-concurrent-safety-v1-8-e3d86e44cd38@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0016.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::21) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|GVXPR04MB9733:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e756403-d8a3-4ab1-31b4-08de51de1de5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|7142099003|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cTY2bDZ5QXhndWZYTGQweCsvcUZGVGl6Q0NWQzl3S28wTWpjZ2M5anVPcG5i?=
 =?utf-8?B?Z1V0Z2p1L2w1RGNSbTVPY0hBUGgzaWxlZnp2dUJ6MDF5VTdJazJRa2JVZ01l?=
 =?utf-8?B?cXJVZkpweHh2dmVPWW9KdTljdGpFWnFOWUZNMFE1bExra0Vjb2hHRjlUVzJp?=
 =?utf-8?B?SUE5dXFXeWZZUWZldUJ1RVFIRUpSMHBWRFNsdG1jZlFyQlVQZVFMaGlQNHVa?=
 =?utf-8?B?S1lLb3ZJc2RwNE5id01yK2ZxZytPcFpEK3AzZUxDWkNVU0czRHVjQUNYY083?=
 =?utf-8?B?dXp1VUU3RGl2NkJWZnJYcnJLNnRKVkU0MXBjSkt0OHJySThWVi9VcjYybDI4?=
 =?utf-8?B?dkw1bGkwNEpScjh1N3FwWHM2Y2hsSmllVGk1eHkxcUFnbTlaTGlmL2RsNE94?=
 =?utf-8?B?M2w2VTNzQXNjNEl3OWJkS0RYSk42YVNBN3h1VEg2Yy9HanF2NENxRmZoTlZu?=
 =?utf-8?B?aklKNTJMTGhoenI0RFhETEtqc1RUZXR1MXNjVVBQZ0tvQno1SitwZy9Qakla?=
 =?utf-8?B?cFMrTGtvaEFDUjZRK2tpaEdRRmpqckVRenJzVzdoY3o3MGw2d1kyQzJCL3gw?=
 =?utf-8?B?eWpMT0xQUHp0aXQ3TGd2SHVjeTFPZjc2NFordXNXcUtuclhHclVzZUZKako1?=
 =?utf-8?B?R0U5WWVMbHVWYVUyNHNPVmtBenVNUkloK0ZDTForMmVFV0hzU3dyZVRBL0Fv?=
 =?utf-8?B?cHRyMmx2bFRVaTlFaHRyYW9hN21zWkthdklRaC9MQjZnejFaTWE2S3h3ZXBE?=
 =?utf-8?B?L3FEbjlxR2tkanpFR01FUGlDQ251aVBWMVVFaUwzUEpGWE9MY3NQa2VYaG9M?=
 =?utf-8?B?RGF6T0tlU3VUQUpNbDEwQ08reEJXa2ttdVQxV2IxTTBlaGpkaXhjaXQxY2Rj?=
 =?utf-8?B?TzdWQVhrRkhvZlpyTDBhRm5nT3RiVzF3Y2Z2aXVnTi9XZmFiSHIxQ09iYlhl?=
 =?utf-8?B?VjZ4U3VyU1g4blE5UGhka2E1M2lZbFRxL0g4Qk5LenJTVFRJYnBoemoyQWtB?=
 =?utf-8?B?RklqUW9aNnk4TFUzTkhLTjB4MWxNc1Z2SlE1cC9Rd1dsVC9VclhLdnczcjVN?=
 =?utf-8?B?clZUR3loZTJDZXR4ZkgrYjNVdDZWWlJrTVhOWXhyVk8wT3ZHSExPUHZVYjQ5?=
 =?utf-8?B?MmJLZ05YbFFiQ3ZzZ0JyOFgrY29EdlU5V002SytrNlZUOVhkMXVwSDVRdFpu?=
 =?utf-8?B?ekwwRC9VcG9wSEIxa2NuR3VsbXk4dHVtRDdTSCtML0cyQnptM1lPZExQZWVO?=
 =?utf-8?B?MHoxSys1bUc4Z21tRWphdXV0UXZPeG1sampzMzBpeXljT0RJbFVOTzM4cTRw?=
 =?utf-8?B?R2Frc2xFN1pZMkVJODMvUVVnNEp0MjgxSEMwc0xEbWVJcFhaMmlodWpWcElC?=
 =?utf-8?B?M28rZVdQSWowVnhBcHNjTFBSd3UrVktQcXpHTEwwSVh1OW4zdlgxUnZ6UWtk?=
 =?utf-8?B?dmttV3hNZDQvSTZDL1lycHJ1Vi9OeEkvWi8yYWtXaEtmdGRjdFhWS1g0ZGxD?=
 =?utf-8?B?eXBRbFBncENDVzRJOUlvV0dEMVRmMjRyS05yUHJ3ZE4xTTV1WVF2ZVZtS1o4?=
 =?utf-8?B?UkhHU2pYb1VraXRwWGJpTTBJRnhKN0kzV0Q0OVFlV05CeFZpL1BVU0hkODM5?=
 =?utf-8?B?Qkt3NWE2aWxUL1g2R3NPRTh0UzRzZWg2NWkvZUt2U2lMNU9VM2E1RWEzRzRB?=
 =?utf-8?B?Sm52WWNBUWw2L1VPRG1LMFRZTXFud3ZGd3hQMmkwQTh4dHIwMnpKR0ZZNUho?=
 =?utf-8?B?R1ZkeitaSGJiZXN1VGpJN2UySlFUeW1SaFRJY25jcXZNSWd1TVpJR1FTdDV3?=
 =?utf-8?B?VXZqUEYvT3Q3QkFIVytFWDZFRFBjMDQrSThPdVE3WExwQzJJOHk5RnpiUVF2?=
 =?utf-8?B?QVFWQW1EVmgwcER3di9FQkVrdWlwUUZBOTlmSG1aSjY1MWc1MWREVHcrQmpn?=
 =?utf-8?Q?tZpArpoVlOjTBU8sOTve/hUAsv0lAE2p?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7142099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cXZqOUR2Lzd5a2t3dGJCN3k2NytJd1VNcTRyZzRYVlIvaU1MNXZxZ0pyUjJW?=
 =?utf-8?B?clJXOWZBZEtyM3RoTFNITEt1dFVaaUs5UFVjQVNRVE9BenB4NFcvMFdrUDB5?=
 =?utf-8?B?QUF0N0o4dDNaMFF6THlnaURKMmg0bXhuQTBlcmV3aWt5cE1RUlQ3SHlDaGZK?=
 =?utf-8?B?RmhxakdLNnU0YXcwY3ZDekpZN1R6ZW41MDJIN1c4MnVHQVp3bm9Gdkw1MXh6?=
 =?utf-8?B?N2F1eEhtbU11dEJwZWI4L09tWEZQTEZBZko3ZExRN283ZWxhT0pGTUJaWXls?=
 =?utf-8?B?TXhlODVLVitWT2FEVEpNS3VGem1xRDV6b2ZrL1Nob25tZXBCcnpTdXJ0SmY4?=
 =?utf-8?B?Q20zR0N3VnQ4aUdUampKKzdrYVh3RktucENGSyt6QkppRzlRYm9SSGNqQVJH?=
 =?utf-8?B?NDBuZUZvUkluSEthbzBncm51aWxhQ3RBV0srVFBqK2ZwUGpWWTJLajJQNTJt?=
 =?utf-8?B?dWhkd0FDWGpoVk1oNVVzTEpEY1UydWJ1ZG5LTnZWajJHS3lVM2h6cWxtSXZN?=
 =?utf-8?B?MHVHUmhSck1rM3dHRUpDcm40TVUzdGN5SlIvb0RWU3RrVWp6TU5TQk9Ka2JN?=
 =?utf-8?B?K3Z6blBRcUFpaTdIYnpoeWF3aGRsL3FyV2JUeGhtYjUrWWRWZXZ5Y1g3dHZ5?=
 =?utf-8?B?U0JnLzQwNEsxb3dpajBtM0dVNDBVN2dwbHlzVHQwSTZmUWoxT2dUWG1PUUF6?=
 =?utf-8?B?RXB0cTNIS0F5RjM3VW5zdWxtTTM5RCtldTcxcWtybWlua2VpYi8ydWpMTmxW?=
 =?utf-8?B?ZFJuWkhIOFpUc3ViTDkzUmo1VXk0ZTZZVmlpc2xYV1ZGMjFqVlVLOE1UaTNz?=
 =?utf-8?B?cHorZnF0NTNQZHZXTlplUGJ3Y09waU5ZUnE1eVVYc1F5clEvOXpiczJKTmNB?=
 =?utf-8?B?U2RnRVMvTmFKaERxWkQ2R1o0akJZUWhTSmJxbkM5QzV3dXFHTlFUWDRxTDI2?=
 =?utf-8?B?ME9hMVpUR3Q1Uk5FZzFRQ2hkalZVa2RVY1hIZWlMNGtGVW4zMUtQT1JMUUxw?=
 =?utf-8?B?N0FWTUhuOFZ0MkZPNWFrRFBxZDVDN0ZzQUlVUzQ0L3B2UlRnR250Y3grSklo?=
 =?utf-8?B?MTdkOGlnMTRIajZLUm1wb0hJR0toUUszS1gzWllSK3lYWmR1ZllkeDBvd1dj?=
 =?utf-8?B?WmtHdjYwYnJyVzd6UkZscFRHc0o2aThlQXU3T0NVTXlyQ3NkUmhWbURCLzRB?=
 =?utf-8?B?d2pod1hKM2c4UWtvbmRuMXlhMEFvMk9TQUdzQWorWWJ3KzhrcWVybTZnT2U4?=
 =?utf-8?B?YzBieG1Ec2JrZHZYWktWUnRCVENBWFVqTTYrQmpaNU9KQjZjQVdqV3c3QUU5?=
 =?utf-8?B?TTRQd2VnYWg3ZFhOVVpvOElTVUZ6SHk1TXU5Mkg2YXB0ZDBDOWNOMi9zd1lX?=
 =?utf-8?B?enN6MzFSZ2hWMGtySnorTFFTUktZV3NNR0diMHZkOG9oQmZ5dHF4czV5dGo3?=
 =?utf-8?B?aWFBRnZDaXZ0UVBBZkdvekVvbndKNFJGYVlKMHRUaUpPSGQ4YXFKUUVlRkhk?=
 =?utf-8?B?MXZJZTE5c0pLYitFR1M4YlV3dnVVd3c3WnFZbVlpei9LWmZrdnZydWxCQW4w?=
 =?utf-8?B?Mm10L0g1ZDVGSTg5bXg1THMzRTh5d0QvR25JZmlwYWlzS3FwenU0b3V0RDBk?=
 =?utf-8?B?VFBaK3FuQlp3VWwra3BIUTdwckVpRWtjTWIvdFhZSVFkMmYyV3pqOUd0bXZP?=
 =?utf-8?B?Qzd5MS9PNkRsN1JtbGtwcXJReFJWSGpjTnI3eU8zWWo5YlJkTkc4d1oxZnBx?=
 =?utf-8?B?Zm5tU3N2NTE0cmUxNG8xY2NBR3BsaXoxN05HYnZQNHdVL2dmMm03L0ppYmNa?=
 =?utf-8?B?elk2MDUwTk9RU0ZkY0ZhektENG94QTNTUFdTek1hWkMrckFVTzB6SEtHczNX?=
 =?utf-8?B?TEJJK0diVG1mRHJwcUdSdWtMK3hkTG85TDVNZS82Y1FSWjhPRjdSYzl6RXYy?=
 =?utf-8?B?UjVxUmNLcUoxVHVXTEVNaGMyeS9MVmVTc2dHVU1NREQ2bVBObXhQMWpzUzgx?=
 =?utf-8?B?UkF4VDB1T0MySXFPMjFCSytlWXRVWERMRW5CNDlOSWYxQmNaQURsODhTUUFY?=
 =?utf-8?B?SUcwL2VYMCswakJPb045bVI1dUxkLzVrRS9USVdDUTRNZjJYUWZZeVdYaDkr?=
 =?utf-8?B?RFVFUGFrRTkvMElPdkNXZlh2QlNnR21lMUtyS1ZuSmZDT1NNS2ZaVUVNd05z?=
 =?utf-8?B?VXNwYWxJM1J0WXhvcnJ1M3dhWVZZUHZaYTRBazBtN013R0xBSDgyMUFDNzVx?=
 =?utf-8?B?K0RiVjVXMG9KT2RjTVdTekNEb0lZQWd6U2ZYTkQ0ZnQrckFESWpPdFkyN0s1?=
 =?utf-8?B?aXNUOExOWW5vUk9lb21zNEtyRFE2VlFia0NLQWRUdkQvTG1HTWJjUT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e756403-d8a3-4ab1-31b4-08de51de1de5
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 13:25:56.0307
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y9keSZx2kL1SCwuoao/WZqpeU+SSjlX5GNAuCCxjBbpU3hAv/hn+CCQlE+YZZGVpAttnRWtG7ahLOYmkZXiKPgCFXMxnytawbc7J1s1J25Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9733
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 12 Jan 2026 13:26:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8456

Hi Antonin,

On 12/22/25 1:27 PM, Antonin Godard wrote:
> Add a special "supported_distros" argument to the script to make it
> possible to return the list of supported distros. This is useful for use
> in a external script, to run the docs build on a specific set or all
> supported distros concurrently.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/tools/build-docs-container | 49 +++++++++++++++++++++-----------
>   1 file changed, 32 insertions(+), 17 deletions(-)
> 
> diff --git a/documentation/tools/build-docs-container b/documentation/tools/build-docs-container
> index c5cdd9c4c..510435c3c 100755
> --- a/documentation/tools/build-docs-container
> +++ b/documentation/tools/build-docs-container
> @@ -20,6 +20,32 @@
>   
>   set -eu -o pipefail
>   
> +declare -a _SUPPORTED_DISTROS=(
> +  almalinux:8
> +  almalinux:9
> +  centos:stream9
> +  debian:12
> +  debian:13
> +  fedora:39
> +  fedora:40
> +  fedora:41
> +  fedora:42
> +  leap:15.5
> +  leap:15.6
> +  rockylinux:8
> +  rockylinux:9
> +  ubuntu:22.04
> +  ubuntu:24.04
> +  ubuntu:25.04
> +  ubuntu:25.10
> +)
> +
> +
> +if [ "${1:-}" = "supported_distros" ]; then
> +  echo "${_SUPPORTED_DISTROS[@]}"
> +  exit 0
> +fi
> +
>   SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
>   CONTAINERCMD=${CONTAINERCMD:-docker}
>   DOCS_DIR="$SCRIPT_DIR/../.."
> @@ -35,24 +61,13 @@ $0 OCI_IMAGE [make arguments...]
>   
>      OCI_IMAGE is an image:tag of an OCI image hosted on hub.docker.com. It is one

Oopsies, centos:stream9 is not on hub.docker.com!

>      of:
> -     - almalinux:8
> -     - almalinux:9
> -     - centos:stream9
> -     - debian:12
> -     - debian:13
> -     - fedora:39
> -     - fedora:40
> -     - fedora:41
> -     - fedora:42
> -     - leap:15.5
> -     - leap:15.6
> -     - rockylinux:8
> -     - rockylinux:9
> -     - ubuntu:22.04
> -     - ubuntu:24.04
> -     - ubuntu:25.04
> -     - ubuntu:25.10
> +"
> +
> +  for distro in "${_SUPPORTED_DISTROS[@]}"; do
> +    echo "   - $distro"
> +  done
>   
> +  echo "

No need to cut the usage string in two, you can call subshells directly 
in it, e.g.:

echo "test

$(for distro in "${_SUPPORTED_DISTROS[@]}"; do
     echo "   - $distro"
done)

testestest"

Should work just fine.

No need to change it, just wanted to highlight there's also another way 
of doing it :)

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Tested-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

