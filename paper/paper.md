---
# Example from https://joss.readthedocs.io/en/latest/submitting.html
title: 'adverseimpact: An R package to compute statistical indicators of adverse impact in selection decisions'
tags:
  - R
  - adverse impact
  - personell selection
  - employment policy
  - employee assessments
authors:
  - name: Dragoș Iliescu
    orcid: 0000-0002-5958-3920
    affiliation: "1, 2"
  - name: George Gunnesch-Luca
    orcid: 0000-0002-7563-8020
    affiliation: 3
  - name: Deborah Rupp
    orcid: 00000-0001-5992-3879
    affiliation: 4
  - name: Anna Walker Nottingham
    affiliation: 4
affiliations:
 - name: University of Bucharest
   index: 1
 - name: Stellenbosch University
   index: 2
 - name: Friedrich-Alexander Unversity Erlagen-Nürnberg
   index: 3
 - name: George Mason University
   index: 4
citation_author: Iliescu, D., et. al.
date: 08 June 2023
year: 20023
bibliography: paper.bib
output: rticles::joss_article
csl: apa.csl
journal: JOSS
---

# The Problem

*Adverse impact* is a term that denotes the detrimental consequences that a specific policy, practice, or decision, typically associated with employment or education, can impose on a certain group. It is a statistical phenomenon that arises when individuals from one group, often a legally protected demographic subgroup, are chosen at a significantly lower rate than those from a comparison group [@dunleavy2017]. This impact can manifest when an organization's policies or practices, though seemingly neutral, inadvertently result in a disproportionate effect on members of a specific, often legally protected, group.

The significance of adverse impact lies in its potential to foster discrimination and inequality in various spheres of life, including the workplace and education [@eeoc1978]. It can obstruct certain groups from accessing equal opportunities, an act that is not only unjust but may also contravene anti-discrimination laws. By recognizing and addressing adverse impact, organizations can take proactive measures to ensure their policies and practices promote fairness and inclusivity, thereby benefiting all involved.

# Statement of Need

In a typical adverse impact scenario, both the candidates under consideration and those ultimately selected belong to either a minority or a majority group. This scenario is often represented by a 2x2 matrix, which includes the number of participants from both the minority and majority groups who either pass or fail the selection procedure. This matrix is then subjected to statistical analysis to determine the presence of adverse impact.

Numerous metrics have been suggested in academic literature to measure adverse impact, as outlined in works such as @morris2017 and @oswald2017 in the fields of psychology and management, and @gastwirth2011 in legal studies. These metrics encompass both measures of statistical significance (including the *z-test*, the *chi-square test*, *Fisher's exact test*, and Lancaster's *mid-p* test) and practical significance (including the impact ratio, the *phi-coefficient*, the *odds ratio*, the *absolute difference in selection rates*, the *h-statistic*, the *shortfall statistic*, the *adjusted shortfall statistic*, and the *absolute disparity ratio*). Organizations, plaintiffs, expert witnesses, courts, and researchers routinely use these adverse impact metrics to ascertain if the differences in decision rates across groups are significant from either a statistical or practical perspective [@siskin2005].

# The Package

However, it’s noteworthy that, to date, no software package has incorporated these crucial indices for swift, straightforward, and convenient computation. While some few of them (e.g., the *chi-square*) can be computed with other packages, most of them are so typical for adverse impact calculations that they have not been implemented to our knowledge in any other package. As such, this package was designed for use by practitioners, researchers and students in such fields as psychology, management, and law. It is part of a larger academic effort that includes submitted papers [@nottingham2023b] or conference presentations [@nottingham2023] that include Monte Carlo simulations to demonstrate proper parameter choices for adverse impact calculations and offer guidance across various stages of the selection process. 

# References


