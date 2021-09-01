Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.40])
 by mx.groups.io with SMTP id smtpd.web11.6922.1630498599427818804
 for <docs@lists.yoctoproject.org>;
 Wed, 01 Sep 2021 05:16:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@cherrycloud.onmicrosoft.com header.s=selector2-cherrycloud-onmicrosoft-com header.b=fXIDQUd5;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.14.40, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SwUR3BxqaVC1jOwOQlmMoKr1tdSuc2CAf5OOF6Cnggecx38KCyvvorA2KBVNed1spwuLqtJs05E/3OuAzfpWiCbeUeVUUE5ghdHnIQcfFVMmFXriB8wg7HyScZ6BIjXMqaV8oDcuENTpRMycQ6Xd0DYBAa4ZkCi2TsmUpnu2bl++2cM5gTd0qbK55QvR5CwyBsSr1WN/KVSB8Y9wttIuuL3xzgHmOK+4awOSrnPpmaO+132noAdr1zY/NRwIbJqIVHsXzDiIEgj3XP/vcPcXjP5KllG9BSFgShgUDFiqqeAxPckOvS3P8xL837tx8PNF6RE+TAyHeGGNLVBk4bX9BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=qTR4J/8PtIq4A7uebnG2HW58rfeuej5iFp6Z7imVYts=;
 b=OHDC0jqov44lpxiOVDND/ejw1DZaXmIt9eFoaDxol0rQsk9WWd9i0vO/m/3I8dAPO14/srmKt8hffVwnp1WQ3RAUI6Q5dv851Amn/VRGc9CcVb6fdXMN4arMVedLd4Tt8A3qogRaAg83uVMrWHkxI0jLs2lYIOcX6jyoBKMjwCASv+SJqYLaURmrvqcd+dG2cjefr3yeVSNCkwf/jNha3FWvepo1m0zrpRYshPQx0BTA6iog7alh4/5BGQnjyNLsm9LhtKMGl4MXYNQWLv4pgVOv7FfI2ZlUAWVk21/Oe++TgC6H0pguVJv5xhtE3LgA0+kGeN9aLoywxvVBahQxOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qTR4J/8PtIq4A7uebnG2HW58rfeuej5iFp6Z7imVYts=;
 b=fXIDQUd5gWlo8LKEYrmJEOGam4NCUYTZTergyGokcIMTLeTmBLDL0Vi3nxJE6wvgu3Mbe77LbjCTj8pIU9H/BHzLeCbuPLSmZqFNHzhBJwYVO33Pls7igESqOo79N0A4fk0dAa4GrCKTLP9zlxgXvEIwECfk5uSquTAwev6SuHQ=
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM8PR04MB7411.eurprd04.prod.outlook.com
 (2603:10a6:20b:1d8::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17; Wed, 1 Sep
 2021 12:16:36 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::706a:b082:742a:7d00]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::706a:b082:742a:7d00%6]) with mapi id 15.20.4478.017; Wed, 1 Sep 2021
 12:16:36 +0000
Date: Wed, 1 Sep 2021 14:16:34 +0200
From: "Quentin Schulz" <quentin.schulz@theobroma-systems.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	docs@lists.yoctoproject.org,
	"Robert P . J . Day" <rpjday@crashcourse.ca>
Subject: Re: [docs] [PATCH] dev-manual: correct note about virtual providers
Message-ID: <20210901121634.ug7wc6ofr5hzevm4@fedora>
References: <20210830153720.68398-1-michael.opdenacker@bootlin.com>
 <795cdbf31208231b7ab001464b7247524aa6b459.camel@linuxfoundation.org>
 <20210831094951.syxtrwtk65jziwbk@fedora>
 <c5458825b741ce1fad5737d46a0a5210cabc4548.camel@linuxfoundation.org>
In-Reply-To: <c5458825b741ce1fad5737d46a0a5210cabc4548.camel@linuxfoundation.org>
X-ClientProxiedBy: AM0PR06CA0102.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::43) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
Return-Path: quentin.schulz@theobroma-systems.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fedora (92.42.140.82) by AM0PR06CA0102.eurprd06.prod.outlook.com (2603:10a6:208:fa::43) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend Transport; Wed, 1 Sep 2021 12:16:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e21db25d-1355-4170-0fe5-08d96d4257c8
X-MS-TrafficTypeDiagnostic: AM8PR04MB7411:
X-Microsoft-Antispam-PRVS: 
	<AM8PR04MB7411E3394762F3199C6F906DC2CD9@AM8PR04MB7411.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LvOsck0sM54py2dHFhd4aXsJeVOTbTIYeTqOGRwZc+i4yUOtmi7p1Ayut2e0h7AQkBlKlN72JCk0zzS97aZ8qL9nSnAokAL0xHHK2kMGsJuIxdm5+528dwHmq7dCuhjZYYMDN1tVz/7oxMbgyfxAH6a/YPNq4Mbu2zf6ojOZdmjnMCx1/YBBbeiatNY1PB4C4AA6VlLnMUWUXjZwP7gyCEZ+CG2W49Wv9XcExWjEs8dKtWL/QBJBbZGQScyhFpSaZg9pU9Z6NnARlFFUFrke1YwIa0inc676JGmU/jtDVYqudjy3NXSe4N0PATkOfmtv+gaQrqZIktMrn3gSmvhfYIz8wy4sQkybeWTSOhDiUEik9T/s92p6vgLoOzFq1wtQP7FQICClaKranFCRFnFjs1MP8bDoE/VN1FDotcajoigoNtrlEdqHNTzWlr5QJn7yXDVrbWyVaZdbpIewVuhEimXKogAQbqORhglVE8BFRYroj8jPENQAy3hvtfGsgF8hFgm2Dhuxwus69N3o2fEluXCsE7eeZM2Ufrr74xQG5h17/KuQxlsGuiPlm2KT8lMH7KZAXRX8B6b05dGAlTsUutShY8O6c1MrTLVTJQtsLZh54TA1ndC6TpVQ5n3Yk9WAvP3BFlL2MOQ4LNvvW83yL0mthIAFIS9OWbb6HoNXwybPRVadzCl+9Gob22XBeRYiw3M9XuhOm0kmwlZpSGGNjY6cce04RMrcAp9C03awvopfHvUlkUVB7MNJaA5J1qyH4mgCTDxKb62blhc96+/8A7xlv1dGatS/qktmcfKVaHYI7VbcDFd31RFCgV6v/mhk
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(136003)(39850400004)(366004)(376002)(346002)(956004)(9686003)(38100700002)(38350700002)(54906003)(55016002)(44832011)(6916009)(66476007)(86362001)(33716001)(83380400001)(8936002)(478600001)(8676002)(2906002)(9576002)(1076003)(966005)(66946007)(186003)(26005)(316002)(4326008)(66556008)(5660300002)(6496006)(52116002)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?inhnyCqH12cSSFXJtm2RXielNI1k5mAZL/7vfJifqAgIGnrHMAyThrMxvUrl?=
 =?us-ascii?Q?cXDGsShIgssGPHeXfUw45u7GVZ9N/0TW2K/LpBR32bIngvlRrA5REQRaMUFq?=
 =?us-ascii?Q?3v8H79LZXqyB8Y16mnf7JLB3MhcK+LDruMk5JFjNvRuoP/QXwy05toMIGEln?=
 =?us-ascii?Q?Zw7QOmJm7IrCSXTNU6D3/FsMfjS6jno6Ryw7FqQoXMbCQXsst3XmKsf/VJFj?=
 =?us-ascii?Q?0RsyNkUgHJVqsc9W7JgX3IcDYNlPq3lxABUU9mSCYaVsguAhzyXt6ESMK3xO?=
 =?us-ascii?Q?1lDrLqe85Vak4TKHyTRO+cF4Rv236LYc2FYblkKTShUbSuoCVUOQnN7p51KI?=
 =?us-ascii?Q?yYdsOn8qBdpCVb7Svq1OGFWCE/K93WPWJPz0nC2kpmCwc6QaJi/X2IqMqVbL?=
 =?us-ascii?Q?s4kjP9RTRXl90Mp1mT0Y/W8b7YxIqoVCO5s7QHBwgmGjvBc+goNdbCK38yIt?=
 =?us-ascii?Q?naBzHR2BToL1IF6M+e+CObnYPi4sKC1ypylf+i8rlEhulBsl5NFBGG3wepeb?=
 =?us-ascii?Q?DGNovHf5ChPLKaJqxFCSLPpBCDeEHESDDb/r3hkdBjKleVO8FHx2CAylNrzf?=
 =?us-ascii?Q?p4gjnEleu9JsEvXV5p2nMmrFY5sYlH3GDdKoCt8NOsGRbR2k8JvSylysrzye?=
 =?us-ascii?Q?NOuh0/CBdWepLuXdU+oCFY3lrbmNsKGKgv9D7T9GA3xynThueLJrDxqDt0RD?=
 =?us-ascii?Q?AIDnghl7zguUbeID5Wux0hfDce/NfzafuhXT6yMY/BV7R1Q7OdwtP9o91yOW?=
 =?us-ascii?Q?OLHUGm1j/YZuBfntPYvAlf6JOrs6DGgm/qt147BqXB8lqcq/qG7c8rGNc+4A?=
 =?us-ascii?Q?AhmoK7hwA/MEu2WzkCy258ordM6LeVXKgG4YaxFRHaDfe0JKl1uBfw4TSH/o?=
 =?us-ascii?Q?8PzUKLxOcZTYBopwHPDkANbqOxfne2q8nY9tMEOZTqE5wWfH/iRf98ko8xYk?=
 =?us-ascii?Q?miDI3dDP3hE7nVq/r0dfrGdn9D5iMQ2vCn+omRGqhH8pZGdXDPU3H6t2jW0j?=
 =?us-ascii?Q?2Vsn/uSkC+MTWxZkCEUEUVndRBdOIDjzn5TYgkxlPgkwvcmeHHhAcMhXYN7N?=
 =?us-ascii?Q?gOKb/OgSw/37nyMUgp22YCGi+34NyOjm8AdA4p1kObkRm197A7bfVqItjgXA?=
 =?us-ascii?Q?11C95JNLnIUwrkr7hHdwrsDWM4Q96Z9gO6Cbyc/9+7DUgDQorVKT2xqTV65g?=
 =?us-ascii?Q?fsrqWmbYNfTqh1bqPopX1kd/ckbR/6Vn+OJS/mj2NJcoc73zRcKjiCvLMXJW?=
 =?us-ascii?Q?sJs1o9gUeOM0tPnTqZI4KLHY+vN0xjLeG5+/1br721Q/t+z6n9fP/uuFLLk8?=
 =?us-ascii?Q?6Kus34yBspbcOT+hMdM5Dbb3?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e21db25d-1355-4170-0fe5-08d96d4257c8
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 12:16:35.9622
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ny0yYgclWBTZN5PsxJ8YaK6wmDZW7NK0A7Cf5YPb8ZI4tzSjppx+ETxhkmAXFy+NsRNjae0BTV+JYo13i4T7Woo2LY6KfWII7ThvgUsaIp+6X420NZGYsCZdUDRVP8nn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7411
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 31, 2021 at 11:01:33AM +0100, Richard Purdie wrote:
> On Tue, 2021-08-31 at 11:49 +0200, Quentin Schulz wrote:
> > On Tue, Aug 31, 2021 at 10:16:49AM +0100, Richard Purdie wrote:
> > > On Mon, 2021-08-30 at 17:37 +0200, Michael Opdenacker wrote:
> > > > Fixes [YOCTO #14530]
> > > >=20
> > > > Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> > > > Reported-by: Robert P. J. Day <rpjday@crashcourse.ca>
> > > > ---
> > > >  documentation/dev-manual/common-tasks.rst | 7 ++++---
> > > >  1 file changed, 4 insertions(+), 3 deletions(-)
> > > >=20
> > > > diff --git a/documentation/dev-manual/common-tasks.rst b/documentat=
ion/dev-manual/common-tasks.rst
> > > > index f3b5084436..dd015a761e 100644
> > > > --- a/documentation/dev-manual/common-tasks.rst
> > > > +++ b/documentation/dev-manual/common-tasks.rst
> > > > @@ -2114,9 +2114,10 @@ The following lists specific examples of vir=
tual providers:
> > > > =20
> > > >  .. note::
> > > > =20
> > > > -   Virtual providers only apply to build time dependencies specifi=
ed with
> > > > -   :term:`PROVIDES` and :term:`DEPENDS`. They do not apply to runt=
ime
> > > > -   dependencies specified with :term:`RPROVIDES` and :term:`RDEPEN=
DS`.
> > > > +   Virtual providers can be applied not only to build time depende=
ncies
> > > > +   specified with :term:`PROVIDES` and :term:`DEPENDS`, as show in=
 the
> > > > +   example above, but also to runtime dependencies specified with
> > > > +   :term:`RPROVIDES` and :term:`RDEPENDS`.
> > > > =20
> > >=20
> > > This isn't correct. virtual providers of the form virtual/ *only* app=
ly to the
> > > build namespace, not the runtime one.
> > >=20
> >=20
> > What is the mechanism behind RPROVIDES:${PN} then? You could technicall=
y
> > set it to "virtual/something" right?
>=20
> There is no mechanism and whilst you could set it to that, it wouldn't do
> anything useful.
>=20
> > How Bitbake chooses between two recipes creating a package RPROVIDES'in=
g the=A0
> > same "virtual/something" is something I have no knowledge in=A0
>=20
> You don't set that. It doesn't work. It isn't supported. This is what tha=
t
> manual section is trying to say. Making the manual pretend it does doesn'=
t
> change this.
>=20
> > but I feel like it's something that
> > should be explained here, or at least explicit why it does not apply to
> > runtime dependencies or point to where the providers for runtime
> > dependencies are explained in the docs.
>=20
> I've explained this many times before but let me try once again.
>=20
> Bitbake is the interpreter of DEPENDS and PROVIDES and it can see multipl=
e
> providers and choose between them. We have full control over that piece o=
f the
> process.
>=20
> Bitbake picks the combination it thinks the user wants and then bakes it =
into
> the task graph. For any given configuration, one task graph should result=
.
>=20
> The runtime namespace is quite different. RPROVIDES are written into the
> packages and they are interpreted by the package managers. We have no way=
 to
> tell the package manager that when it sees "virtual/shell", it should be =
bash.
> It would be something different for each package manager and at best it i=
s badly
> supported by the distros and packaging backends (e.g. dpkg-reconfigure). =
We've
> therefore not gone there.
>=20
> It is understandable the user still needs to make some choices in OE. The=
se are
> the VIRTUAL-RUNTIME_xxxx variables. These are the virtual/ equivalent fro=
m
> DEPENDS/PROVIDES. The distro hardcodes values of things for the VIRTUAL-
> RUNTIME_xxx variables. This is to try and make it clear these are not lik=
e
> virtual/ and do not respect PREFERRED_PROVIDER. The selections are hardco=
ded
> into packages as they are built.
>=20
> VIRTUAL-RUNTIME is ugly and it is an OE thing, not a bitbake one, there i=
s
> nothing related to it in bitbake. This does make it harder to document.
>=20
> I'd love something nicer but we've never found a way to make it work reli=
ably
> with the package managers, deterministic builds and all our other constra=
ints.
>=20

Thanks so much for having taken the time to answer :)

I want to link to the IRC log here because I continued this discussion on I=
RC
with Richard, please see:
https://www.yoctoproject.org/irc/%23yocto.2021-09-01.log.html#t2021-09-01T1=
1:55:01

Cheers,
Quentin
